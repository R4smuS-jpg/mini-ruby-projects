require './printer.rb'
require './user.rb'
require './word_reader.rb'

class Game
  def initialize
    @user = create_user
    @word = WordReader.read_from_argv || WordReader.read_from_user
  end

  # Method with game logic
  def play
    start_time = Time.now
    end_time = nil

    correctly_guessed_letters = []
    incorrectly_guessed_letters = []

    loop do
      system 'clear'

      Printer.draw_current_gallows(incorrectly_guessed_letters.size)
      Printer.print_correct_letters(@word, correctly_guessed_letters)
      Printer.print_incorrect_letters(incorrectly_guessed_letters)
      Printer.print_remained_mistakes(incorrectly_guessed_letters.size)

      letter = ask_letter

      # Insert or not a letter that user suggested
      if @word.include?(letter)
        correctly_guessed_letters.push(letter) unless correctly_guessed_letters.include?(letter)
      else
        incorrectly_guessed_letters.push(letter) unless incorrectly_guessed_letters.include?(letter)
      end

      # Check if the user won
      if correctly_guessed_letters.sort == @word.chars.uniq.sort
        system 'clear'

        Printer.print_correct_letters(@word, correctly_guessed_letters)

        end_time = Time.now
        @user.time = (end_time - start_time).round(3)
        save_user_score

        abort "You won! The word is '#{@word}'! Congrats!"
      end

      # Check if the user lost
      if incorrectly_guessed_letters.size == 7
        system 'clear'

        Printer.draw_current_gallows(incorrectly_guessed_letters.size)

        abort "You died. The word was '#{@word}'. What a stupid death..."
      end
    end
  end

  # Returns new user
  def create_user
    print 'Enter your name: '
    username = $stdin.gets.encode('UTF-8').chomp.strip
    User.new(username)
  end

  # Save score to file
  def save_user_score
    scoreboard_path = './data/scoreboard.txt'
    file = File.open(scoreboard_path, 'r:UTF-8')
    scores = file.readlines
    file.close
    scores.map! {|s| s.chomp}

    user_has_record = false
    scores.each do |s|
      if s.include?(@user.name)
        user_has_record = true
        scores.map! { |s| s.include?(@user.name) && @user.time < s.split[2].to_f ? s = @user.to_score_record : s }
        break
      end
    end

    scores.push(@user.to_score_record) unless user_has_record
    scores.sort_by! { |s| s.split[2].to_f }

    file = File.open(scoreboard_path, 'w:UTF-8')
    file.write(scores.join("\n"))
    file.close
  end

  # Method that requests letter
  def ask_letter
    print "\nGuess one letter: "
    letter = $stdin.gets.encode('UTF-8').chomp.downcase.strip

    until letter.match(/^[a-z]$/)
      print 'Incorrect letter. Try again: '
      letter = $stdin.gets.encode('UTF-8').chomp.downcase
    end

    letter
  end
end

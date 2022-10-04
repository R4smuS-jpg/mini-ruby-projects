require './printer.rb'
require './user.rb'
require './word_reader.rb'

class Game
  def initialize
    word_reader = WordReader.new

    @user = get_user
    @word = word_reader.read_from_argv || word_reader.read_from_user

    @correctly_guessed_letters = []
    @incorrectly_guessed_letters = []
  end

  # Method with game logic
  def play
    printer = Printer.new

    start_time = Time.now
    end_time = nil

    while true
      system 'clear'

      printer.draw_current_gallows(@incorrectly_guessed_letters.size)
      printer.print_correct_letters(@word, @correctly_guessed_letters)
      printer.print_wrong_letters(@incorrectly_guessed_letters)
      printer.print_remained_mistakes(@incorrectly_guessed_letters.size)

      letter = ask_letter

      # Insert or not a letter that user suggested
      if @word.include?(letter)
        if !@correctly_guessed_letters.include?(letter)
          @correctly_guessed_letters << letter
        end
      elsif !@incorrectly_guessed_letters.include?(letter)
          @incorrectly_guessed_letters << letter
      end

      # Check if the user won
      if @correctly_guessed_letters.sort == @word.chars.uniq.sort
        system 'clear'

        printer.print_correct_letters(@word, @correctly_guessed_letters)

        end_time = Time.now
        @user.time = (end_time - start_time).round(3)
        save_user_score

        abort "You won! The word is '#{@word}'! Congrats!"
      end

      # Check if the user lost
      if @incorrectly_guessed_letters.size == 7
        system 'clear'

        printer.draw_current_gallows(@incorrectly_guessed_letters.size)

        abort "You died. The word was '#{@word}'. What a stupid death..."
      end
    end
  end

  # Returns new user
  def get_user
    print 'Enter your name: '
    username = STDIN.gets.chomp
    return User.new(username)
  end

  # Save score to file
  def save_user_score
    file = File.open('./data/scoreboard.txt', 'w:UTF-8')
  
    file.puts(@user.to_score_record)      
  end

  # Method that requests letter
  def ask_letter
    print "\nGuess one letter: "
    letter = STDIN.gets.chomp.downcase

    until letter.match(/^[a-z]$/)
      print "Incorrect letter. Try again: "
      letter = STDIN.gets.encode("UTF-8").chomp.downcase
    end

    return letter
  end
end

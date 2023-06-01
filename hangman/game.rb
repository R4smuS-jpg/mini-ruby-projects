require_relative 'printer.rb'
require_relative 'user.rb'
require_relative 'word_reader.rb'

class Game
  def initialize
    @current_user = create_user
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
        unless correctly_guessed_letters.include?(letter)
          correctly_guessed_letters.push(letter)
        end
      else
        unless incorrectly_guessed_letters.include?(letter)
          incorrectly_guessed_letters.push(letter) 
        end
      end

      # Check if the user won
      if correctly_guessed_letters.sort == @word.chars.uniq.sort
        system 'clear'

        Printer.print_correct_letters(@word, correctly_guessed_letters)

        end_time = Time.now
        @current_user.time = (end_time - start_time).round(3)
        save_user_score

        puts "You won! The word is '#{@word}'! Congrats!"
        break
      end

      # Check if the user lost
      if incorrectly_guessed_letters.size == 7
        system 'clear'

        Printer.draw_current_gallows(incorrectly_guessed_letters.size)

        puts "You died. The word was '#{@word}'. What a stupid death..."
        break
      end
    end
  end

  private
  
    # Returns new user
    def create_user
      print 'Enter your name: '
      username = $stdin.gets.encode('UTF-8').chomp.strip
      User.new(username)
    end

    # Saves score to file
    def save_user_score
      current_path = File.dirname(__FILE__)
      relative_scoreboard_path = '/data/scoreboard.txt'
      scoreboard_path = current_path + relative_scoreboard_path

      scores = []

      File.open(scoreboard_path) do
        File.foreach(scoreboard_path) do |line|
          scores.push(line.chomp)
        end
      end

      user_has_record = false

      scores.each do |s|
        if s.include?(@current_user.name)
          user_has_record = true

          scores.map! do |s|
            record_time = s.split[2].to_f
            if s.include?(@current_user.name) && @current_user.time < record_time
              @current_user.to_score_record
            end
          end

          break
        end
      end

      scores.push(@current_user.to_score_record) unless user_has_record
      scores.sort_by! { |s| s.split[2].to_f }

      file = File.write(scoreboard_path, scores.join("\n"))
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

require 'pry'

class Printer
  CURRENT_PATH = File.dirname(__FILE__)

  class << self
    # Method that prints current guessed letters(example: A _ _ L E)
    def print_correct_letters(word, correctly_guessed_letters)
      result = 'Current word: '

      word.chars.each do |char|
        result += if correctly_guessed_letters.include?(char)
                    "#{char.upcase} "
                  else
                    '_ '
                  end
      end

      $stdout.puts result
    end

    # Method that prints list of incorrectly guessed letters
    def print_incorrect_letters(incorrectly_guessed_letters)
      result = 'Wrong letters: '

      incorrectly_guessed_letters.each do |letter|
        result += letter.upcase + ' '
      end

      $stdout.puts result
    end

    # Method that draws gallows in console(wow)
    def draw_current_gallows(number_of_mistakes)
      relative_pseudographic_path = <<~PATH.chomp
        /data/pseudographic/#{number_of_mistakes}_mistakes.txt
      PATH
      pseudographic_path = CURRENT_PATH + relative_pseudographic_path

      current_gallows_graphic = File.read(pseudographic_path)
      $stdout.puts current_gallows_graphic
    end

    # Method that print number of remained mistakes
    def print_remained_mistakes(number_of_mistakes)
      $stdout.puts "Mistakes remained: #{7 - number_of_mistakes}"
    end

    # Method that prints welcoming logo
    def print_welcome
      relative_welcome_path = '/data/pseudographic/welcome.txt'
      welcome_path = CURRENT_PATH + relative_welcome_path
      welcome_graphic = File.read(welcome_path)
      $stdout.puts welcome_graphic
    end

    def print_warning
      warning_message = <<~MSG
        Warning!
        You can enter words and letters consist of
        symbols of latin alphabet only.
        Good luck!
      MSG

      $stdout.puts warning_message
    end
  end
end

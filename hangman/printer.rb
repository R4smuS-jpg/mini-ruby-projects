class Printer
  class << self
    # Method that prints current guessed letters(example: A _ _ L E)
    def print_correct_letters(word, correctly_guessed_letters)
      result = 'Current word: '

      word.chars.each do |char|
        if correctly_guessed_letters.include?(char)
          result += "#{char.upcase} "
        else
          result += '_ '
        end
      end

      puts result
    end

    # Method that prints list of incorrectly guessed letters
    def print_incorrect_letters(incorrectly_guessed_letters)
      result = 'Wrong letters: '

      incorrectly_guessed_letters.each do |letter|
        result += letter.upcase + ' '
      end

      puts result
    end

    # Method that draws gallows in console(wow)
    def draw_current_gallows(number_of_mistakes)
      pseudographic_path = "./data/pseudographic/#{number_of_mistakes}_mistakes.txt"
      current_gallows_file = File.open(pseudographic_path, 'r:UTF-8')
      puts current_gallows_file.read
      current_gallows_file.close
    end

    # Method that print number of remained mistakes
    def print_remained_mistakes(number_of_mistakes)
      puts "Mistakes remained: #{7 - number_of_mistakes}"
    end

    # Method that prints welcoming logo
    def print_welcome
      welcome_path = './data/pseudographic/welcome.txt'
      welcome_file = File.open(welcome_path)
      puts welcome_file.read
      welcome_file.close
    end

    def print_warning
      puts "Warning!\nYou can enter words and letters consist of symbols of latin alphabet only.\nGood luck!"
    end
  end
end

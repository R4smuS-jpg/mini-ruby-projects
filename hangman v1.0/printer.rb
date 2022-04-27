class Printer
  # Method that prints current guessed letters(example: A _ _ L E)
  def print_correct_letters(word, correctly_guessed_letters)
    result = "Current word: "

    word.chars.each do |char|
      if correctly_guessed_letters.include?(char)
        result += "#{char.upcase} "
      else
        result += "_ "
      end
    end

    puts result
  end

  # Method that prints list of incorrectly guessed letters
  def print_wrong_letters(incorrectly_guessed_letters)
    result = "Wrong letters: "

    incorrectly_guessed_letters.each do |letter|
      result += "#{letter.upcase} "
    end

    puts result
  end

  # Method that draws gallows in console(wow)
  def draw_current_gallows(number_of_mistakes)
    current_gallows_file = File.open("./data/pseudographic/#{number_of_mistakes}_mistakes.txt", "r:UTF-8")
    puts current_gallows_file.read
    current_gallows_file.close
  end

  # Method that print number of remained mistakes
  def print_remained_mistakes(number_of_mistakes)
    puts "Mistakes remained: #{7 - number_of_mistakes}"
  end
end

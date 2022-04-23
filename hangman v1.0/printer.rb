class Printer
  # Method that prints current guessed letters(example: A _ _ L E)
  def print_current_result(word, correctly_guessed_letters)
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

  # Method that draws gallows in console(wow)
  def draw_current_gallows(number_of_mistakes)
    current_gallows_file = File.open("./data/pseudographic/#{number_of_mistakes}_mistakes.txt", "r:UTF-8")
    puts current_gallows_file.read
    current_gallows_file.close
  end
end

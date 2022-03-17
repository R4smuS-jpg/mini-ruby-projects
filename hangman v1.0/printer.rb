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
    case number_of_mistakes
    when 0
      puts "_____\n"
    when 1
      puts "  |  \n  |  \n  |  \n__|__"
    when 2
      puts "  ______\n  |  \n  |  \n  |  \n__|__"
    when 3
      puts "  ______\n  |    |\n  |  \n  |  \n__|__"
    when 4
      puts "  ______\n  |    |\n  |    O\n  |  \n__|__"
    when 5
      puts "  ______\n  |    |\n  |    O\n  |    |\n__|__"
    when 6
      puts "  ______\n  |    |\n  |    O\n  |   /|/\n__|__"
    when 7
      puts "  ______\n  |    |\n  |    O\n  |   /|/\n__|__ //"
    end
  end
end

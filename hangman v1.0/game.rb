require './printer.rb'

class Game
  def initialize(word)
    if word == nil
      @word = ask_word
    else
      @word = word
    end

    @correctly_guessed_letters = []
    @incorrectly_guessed_letters = []
  end

  # Method with game logic
  def play()
    printer = Printer.new

    while true
      system "cls"

      printer.draw_current_gallows(@incorrectly_guessed_letters.size)
      printer.print_current_result(@word, @correctly_guessed_letters)

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
      if @correctly_guessed_letters.sort === @word.chars.uniq.sort
        system "cls"

        printer.print_current_result(@word, @correctly_guessed_letters)
        abort "You won! The word is '#{@word}'!"
      end

      # Check if the user lost
      if @incorrectly_guessed_letters.size === 7
        system "cls"

        printer.draw_current_gallows(@incorrectly_guessed_letters.size)
        abort "You died."
      end
    end
  end

  # Method that requests letter
  def ask_letter()
    print "Guess one letter: "
    letter = STDIN.gets.chomp.downcase

    while !letter.match(/[a-z]/) || letter.length > 1
      print "Incorrect letter. Try again: "
      letter = STDIN.gets.encode("UTF-8").chomp.downcase
    end

    return letter
  end

  # Method that requests word
  def ask_word()
    print "Enter word: "
    word = STDIN.gets.encode("UTF-8").chomp.downcase

    while !word.match(/[a-z]/)
      print "Incorrect word. Try again: "
      word = STDIN.gets.encode("UTF-8").chomp.downcase
    end

    return word
  end
end

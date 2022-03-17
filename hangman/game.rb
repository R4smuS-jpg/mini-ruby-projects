require './printer.rb'

class Game
  def initialize()
    @word = ask_word
    @correctly_guessed_letters = []
    @incorrectly_guessed_letters = []
  end

  # Game logic method
  def play()
    printer = Printer.new

    while true
      system("cls")

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
        system("cls")

        printer.print_current_result(@word, @correctly_guessed_letters)
        abort "You won! It was word #{@word}!"
      end

      # Check if the user lost
      if @incorrectly_guessed_letters.size == 7
        system("cls")

        printer.draw_current_gallows(@incorrectly_guessed_letters.size)
        abort "You died =("
      end
    end
  end

  # Method that requests letter
  def ask_letter()
    print "Guess one letter: "
    letter = STDIN.gets.chomp.downcase

    while letter !~ /[a-z]/
      print "You can enter only letters. Try again: "
      letter = STDIN.gets.encode("UTF-8").chomp.downcase
    end

    while letter.length > 1
      print "You can enter only one letter. Try again: "
      letter = STDIN.gets.encode("UTF-8").chomp.downcase
    end

    return letter
  end

  # Method that requests word
  def ask_word()
    print "Enter word: "
    word = STDIN.gets.encode("UTF-8").chomp.downcase

    while word !~ /[a-z]/
      print "Word must contain at least one letter. Try again: "
      word = STDIN.gets.encode("UTF-8").chomp.downcase
    end

    return word
  end
end


# Ввод слов с пробелов - печатать _ и не брать в проверку

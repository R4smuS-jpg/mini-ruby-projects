# I think each method from this class is pretty clear
class WordReader
  def read_from_argv
    return ARGV[0]
  end

  def read_from_file
    return File.open("./data/words.txt", "r:UTF-8").readlines.sample.chomp
  end

  def read_from_user
    puts "0 - enter a word by yourself\n1 - let the program choose you a word"
    choose = STDIN.gets.chomp

    while !choose.match(/^[0-1]$/)
      print "Incorrect input. Try again: "
      choose = STDIN.gets.chomp
    end

    if choose == "0"
      system "clear"

      print "Enter word: "
      word = STDIN.gets.encode("UTF-8").chomp.downcase

      while !word.match(/[a-z]/) || word.include?(" ") 
        print "Incorrect word. Try again: "
        word = STDIN.gets.encode("UTF-8").chomp.downcase
      end

      return word
    else
      return read_from_file
    end
  end
end
# I think each method from this class is pretty clear

class WordReader
  def read_from_argv
    return ARGV[0]
  end

  def read_from_file
    return File.open("./data/words.txt", "r:UTF-8").readlines.sample.chomp
  end

  def read_from_user
    puts "0 - enter a word by youself\n1 - let program choose you a word"
    choose = STDIN.gets.chomp.to_i

    if choose == 0
      print "Enter word: "
      word = STDIN.gets.encode("UTF-8").chomp.downcase

      while !word.match(/[a-z]/)
        print "Incorrect word. Try again: "
        word = STDIN.gets.encode("UTF-8").chomp.downcase
      end

      return word
    elsif choose == 1 
      return read_from_file
    else
      puts "Incorrect input."
    end
  end
end
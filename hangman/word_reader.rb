# I think each method from this class is pretty clear
class WordReader
  class << self
    def read_from_argv
      ARGV[0]
    end

    def read_from_user
      puts "0 - enter a word by yourself\n1 - let the program choose you a word"
      choose = $stdin.gets.chomp.strip

      until choose.match(/^[0-1]$/)
        print 'Incorrect input. Try again: '
        choose = $stdin.gets.chomp.strip
      end

      if choose == '0'
        system 'clear'

        print 'Enter word: '  
        word = $stdin.gets.encode('UTF-8').chomp.downcase.strip

        until word.match(/^[a-z]+$/)  
          print 'Incorrect word. Try again: '
          word = $stdin.gets.encode('UTF-8').chomp.downcase.strip
        end

        word
      elsif choose == '1'
        read_from_file
      end
    end

    def read_from_file
      current_path = File.dirname(__FILE__)
      words_path = current_path + '/data/words.txt'
      File.open(words_path, 'r:UTF-8').readlines.sample.chomp
    end
  end
end

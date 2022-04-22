require './game.rb'

class Main
  welcome_file = File.open("pseudographic/welcome.txt")
  puts welcome_file.read
  welcome_file.close

  puts "Warning!\nYou can enter words and letters consist of symbols of latin alphabet only.\nGood luck!"
  sleep 6
  system "clear"

  word = ARGV[0]

  game = Game.new(word)
  game.play
end

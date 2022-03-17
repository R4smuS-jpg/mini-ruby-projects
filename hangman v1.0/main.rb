require './game.rb'

class Main
  puts "Warning!\nYou can enter words and letters consist of symbols of latin alphabet only.\nGood luck!"
  sleep 8
  system "cls"

  word = ARGV[0]

  game = Game.new(word)
  game.play
end

require './game.rb'

class Main
  Printer.new.print_welcome
  puts "Warning!\nYou can enter words and letters consist of symbols of latin alphabet only.\nGood luck!"
  # sleep 6 

  system 'clear'

  game = Game.new()
  game.play
end

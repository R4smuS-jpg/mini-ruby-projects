require './game.rb'

class Main
  Printer.print_welcome
  Printer.print_warning

  sleep 6
  system 'clear'

  game = Game.new
  game.play
end

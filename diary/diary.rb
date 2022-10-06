require_relative 'writer.rb'
require_relative 'reader.rb'
require_relative 'page.rb'
require_relative 'owner.rb'

class Diary
  def initialize
    @reader = Reader.new
    @writer = Writer.new
  end

  def start
    create_owner unless @reader.owner_present?

    puts "Select one option:\n0 - add new page\n1 - read all pages"
    input = $stdin.gets.encode('UTF-8').chomp.to_i
    puts

    case input
    when 0
      create_page
    when 1
      puts @reader.read_all
    end
  end

  def create_page
    page = Page.new

    input_separator = '=' * 36
    puts "What's on your mind today? You can write it down. Type \"end\" to stop writing and save note to the diary.\n#{input_separator}"

    line = ''

    while line != 'end'
      line = $stdin.gets.encode('UTF-8').chomp

      break if line == 'end'

      page.add_line(line)
    end

    page.set_timestamp

    @writer.save_page(page)
  end

  def create_owner
    puts "Oh... Seems like the diary has no owner... You always wanted to have a diary, didn't you? So what's your name?"
    name = $stdin.gets.encode('UTF-8').chomp

    puts 'Such a great name! And... How old are you?'
    age = $stdin.gets.encode('UTF-8').chomp

    puts "I'm going to sign your new diary, give me a second"
    sleep 1
    puts "Oh, that's it! You have a diary now :)\n\n"

    owner = Owner.new(name, age)

    @writer.save_owner(owner)
  end
end

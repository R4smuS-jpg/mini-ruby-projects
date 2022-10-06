class Page
  def initialize
    @timestamp = ''
    @content = []
  end

  def add_line(line)
    @content.push(line)
  end

  def to_diary_page
    pages_separator = '=' * 40
    page = "\n#{pages_separator}\n#{@timestamp}\n" 

    @content.each do |line|
      page.concat("#{line}\n")
    end

    page
  end

  def set_timestamp
    @timestamp = "Date: #{Time.now.strftime("%d.%m.%Y")} Time: #{Time.now.strftime("%H:%M")}"
  end
end

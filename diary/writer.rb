class Writer
  def save_page(page)
    diary_file = File.new('./data/diary.txt', 'a:UTF-8')

    diary_file.puts(page.to_diary_page)

    diary_file.close
  end

  def save_owner(owner)
    diary_file = File.new('./data/diary.txt', 'a:UTF-8')

    diary_file.puts(owner.to_profile)

    diary_file.close
  end
end

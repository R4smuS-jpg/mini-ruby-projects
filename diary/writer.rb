class Writer
  @@diary_path = File.dirname(__FILE__) + '/data/diary.txt' 

  def save_page(page)
    file = File.open(@@diary_path, 'a:UTF-8')

    file.puts(page.to_diary_page)

    file.close
  end

  def save_owner(owner)
    file = File.open(@@diary_path, 'a:UTF-8')

    file.puts(owner.to_profile)

    file.close
  end
end

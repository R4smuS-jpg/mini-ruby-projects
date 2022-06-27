class Reader
  def owner_present?
    return !read_all.empty?
  end

  def read_all
    diary_file = File.new("./data/diary.txt", "r:UTF-8")

    content = diary_file.read 

    diary_file.close

    return content
  end
end

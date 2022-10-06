class Reader
  def owner_present?
    !read_all.empty?
  end

  def read_all
    current_path = File.dirname(__FILE__)
    diary_path = current_path + '/data/diary.txt' 
    file = File.open(diary_path, 'r:UTF-8')

    content = file.read 

    file.close

    content
  end
end

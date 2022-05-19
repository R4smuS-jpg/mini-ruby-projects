class Reader
  def owner_present?
    diary_file = File.new("./data/diary.txt", "r:UTF-8")

    if diary_file.read == ""
      return false
      diary_file.close
    else
      return true
      diary_file.close
    end
  end

  def read_all
    diary_file = File.new("./data/diary.txt", "r:UTF-8")

    content = diary_file.read 
    diary_file.close

    return content
  end
end

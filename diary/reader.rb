class Reader
  def owner_present?
    diary_file = File.new("./diary.txt", "r:UTF-8")

    if diary_file.read == ""
      return false
    else
      return true
    end

    diary_file.close
  end

  def read_all
    diary_file = File.new("./diary.txt", "r:UTF-8")

    content = diary_file.read 
    diary_file.close

    return content
  end
end

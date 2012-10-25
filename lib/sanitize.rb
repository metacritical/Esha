module Sanitize
  #Remove \n line
  def remove_new_line
    self.code.chomp!
  end
  
  #Getting Rid Of more than one space inside code 
  def remove_white_space
    self.code.gsub(/\s+/," ")
  end
  
  #Remove whitespace from beginning and end of line
  def remove_tail_spaces
    self.code.gsub(/^\s+|\s+$/,"")
  end

  def sanitize
    remove_new_line
    remove_white_space
    remove_tail_spaces
  end
end


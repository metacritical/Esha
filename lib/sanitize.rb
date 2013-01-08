module Sanitize
  #Remove \n line
  def remove_new_line
    self.code = code.gsub(/^(\n)+/,"") #Remove New line from beginning
  end
  
  #Getting Rid of more than one space inside code 
  def remove_white_space
    self.code = code.gsub(/\s+/," ")
  end
  
  #Remove whitespace from beginning and end of line
  def remove_tail_spaces
    self.code = code.gsub(/^\s*/,"").gsub(/\s+$/,"")
  end

  def remove_semicolon
    ""
  end
  
  #Sanitize Input Code
  def sanitize
    remove_new_line
    #remove_white_space
    #remove_tail_spaces
  end
end


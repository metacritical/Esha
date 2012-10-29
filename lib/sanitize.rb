module Sanitize
  #Remove \n line
  def remove_new_line
    self.code = self.code.gsub(/^\n/,"") #Remove New line from beginning
    self.code = self.code.gsub(/\n/,";") #Replace new line from rest of code with ;
  end
  
  #Getting Rid of more than one space inside code 
  def remove_white_space
    self.code = self.code.gsub(/\s+/," ")
  end
  
  #Remove whitespace from beginning and end of line
  def remove_tail_spaces
    self.code = self.code.gsub(/^\s*/,"").gsub(/\s+$/,"")
  end
  
  #Sanitize Input Code
  def sanitize
    remove_new_line
    remove_white_space
    remove_tail_spaces
  end
end


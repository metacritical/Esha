class Lexer
  attr_accessor :code
  
  #Initialize With Code
  def initialize(input_code)
    self.code= input_code
  end
  
  #Remove \n line
  def remove_new_line
    code = code.chomp!
  end
  
  #Getting Rid Of more than one space inside code
  def remove_white_space
    code = code.gsub(/\s+/," ")
  end
  
  #Remove whitespace from beginning and end of line
  def remove_tail_spaces
    code = code.gsub(/^\s+|\s+$/." ")
  end
  
  def tokenize
    #List All Parsed Tokens
    parsed_tokens = []

    #Initialize Start Bracket
    start_bracket = 0

    #Initialize End Bracket
    end_bracket = 0

    #How Deep Are we nested
    nesting_level = []

    #Initialize loop variable i to zero
    while i < code.size
      
    end
  end
end

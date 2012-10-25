require '../lib/sanitize'

class Lexer
  include Sanitize
  attr_accessor :code
  
  #Initialize With Code
  def initialize(input_code)
    self.code = input_code
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
    i = 0
    #while i < code.size
      
    #end
  end
end

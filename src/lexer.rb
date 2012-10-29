require_relative '../lib/sanitize'

class Lexer
  include Sanitize
  attr_accessor :code
  
  KEYWORDS = ['Object','Lobby','Protos', 'Number', 'File','String', 'Vector', 'Sequence', 'List', 'Date', 'Socket', 
              'URL', 'Directory', 'Scheduler','System' , 'Networking', 'XML' , 'Future', 'Call', 'Coroutine', '(',
              ')', ':=', ',', 'clone', 'method', '+', '-', '*', '/','list']
  
  #Initialize With Code
  def initialize(input_code)
    self.code = input_code
    sanitize
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

    current_char = self.code[i]
    
    puts "Input code : #{self.code} \n\n"
    while i < self.code.size
      chunk = self.code[i..-1]
      puts "Reduce : #{chunk}"
        if identifier  = chunk.match(/(\S+)\w*/).captures.first
          #puts [identifier ,identifier.size].join(" ") # Just a temporary stuff to see match words
          if KEYWORDS.include?(identifier)
            parsed_tokens << [identifier.upcase.to_sym , identifier]
          else
            parsed_tokens << [:IDENTIFIER, identifier]
          end
        end
       i += identifier.size + 1 
    end
    
    #End the token with false
    parsed_tokens << [false, false]
    
    #Tokenized Output
    puts parsed_tokens.inspect

    #code.split(" ")
  end
end

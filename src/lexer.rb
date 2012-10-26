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
  end
    
  def tokenize
    #Sanitize Input Code
    sanitize

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
    
    puts "Input code :" + code + "\n\n"
    while i < self.code.size
      chunk = code[i..-1]
      current_char = code[i]
      
      if identifier  = chunk.match(/\A(\S+)\w*/).captures.first
        puts [identifier ,identifier.size].join(" ") # Just a temporary stuff to see match words
        if KEYWORDS.include?(identifier)
          parsed_tokens << [identifier.upcase.to_sym , identifier]
        else 
          parsed_tokens << [:IDENTIFIER, identifier]
        end
      end
      
      i += identifier.size + 1
    end
      
    #Tokenized Output
    puts parsed_tokens.inspect

    #code.split(" ")
  end
end

lexer = Lexer.new("Person := Object clone").tokenize

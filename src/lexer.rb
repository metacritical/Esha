require_relative '../lib/sanitize'

class Lexer
  include Sanitize
  attr_accessor :code
  
  RESERVED_WORDS = [
              'Object','Lobby','Protos', 'Number', 'File','String', 'Vector', 'Sequence', 'List', 'Date', 'Socket', 
              'URL', 'Directory', 'Scheduler','System' , 'Networking', 'XML' , 'Future', 'Call', 'Coroutine', '(',
              ')', ':=', ',', 'clone', 'method', '+', '-', '*', '/','list'
             ]
  
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

    current_char = code[i]
    
    p "Input code : #{code}"
    while i < code.size
      chunk = code[i..-1]
      puts "#{i} - Reduce : #{chunk}"
      if identifier = chunk[/(\A[a-zA-z]\w*)/,1]
        puts "Identifier size: #{identifier} - #{identifier.size}"

        if RESERVED_WORDS.include?(identifier)
          puts "Identifier : #{identifier}"
          parsed_tokens << [identifier.upcase.to_sym , identifier]
        else
          parsed_tokens << [:IDENTIFIER,identifier]
        end        
      elsif identifier = chunk[/\A\(/]
        parsed_tokens << [:BRACKET_OPEN , identifier]
      elsif identifier =  chunk[/\A\)/]
        parsed_tokens << [:BRACKET_CLOSE , identifier]
      elsif identifier = chunk[/\A(:=)/,1]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:setSlot, identifier]
      elsif identifier = chunk[/\A([0-9])+/,1]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:NUMBER, identifier]
      elsif identifier = chunk[/\A\".+\"/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:STRING, identifier]
      elsif identifier = chunk[/\A(\n)+/m,1]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:NEWLINE,"\n"]
      end
      unless identifier.nil?
        i += identifier.size
      else
        i += 1
      end
    end
    #End the token with false
    parsed_tokens << [false, false]
    
    #Tokenized Output
    puts parsed_tokens.inspect

    #code.split(" ")
  end
end

require_relative '../lib/sanitize'

class Lexer
  include Sanitize
  attr_accessor :code
  
  KEYWORDS = [
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

    current_char = self.code[i]
    
    puts "Input code : #{self.code} \n\n"
    while i < self.code.size
      chunk = self.code[i..-1]
      puts "Reduce : #{chunk}"

      if identifier = chunk[/\A([a-zA-Z]\w*)/,1]
        puts "Identifier : #{identifier}"
        parsed_tokens << [identifier.upcase.to_sym,identifier]
      elsif identifier = chunk[/\A(\S+)\w*/,1]
        case identifier
        when identifier == ':='
          puts "Identifier : #{identifier}"
          parsed_tokens << [:SETSLOT,identifier]
        when identifier = chunk[/;/,1]
          puts "Identifier : #{identifier}"
          parsed_tokens << [identifier.upcase.to_sym,identifier]
        else
          puts "Identifier : #{identifier}"
          parsed_tokens << [:IDENTIFIER,identifier]
        end
      end
      unless identifier.nil?
        i += identifier.size + 1
      else
        i += i + 1
      end
    end
    #End the token with false
    parsed_tokens << [false, false]
    
    #Tokenized Output
    puts parsed_tokens.inspect

    #code.split(" ")
  end
end

=begin

      if identifier = chunk.match(/([a-zA-Z]\w*)/)
        identifier = chunk.match(/([a-zA-Z]\w*)/).captures.first
        #puts [identifier ,identifier.size].join(" ") # Just a temporary stuff to see match words
        if KEYWORDS.include?(identifier)
          parsed_tokens << [identifier.upcase.to_sym , identifier]
          puts "IDentifier : #{identifier}"
        else
          parsed_tokens << [:IDENTIFIER, identifier]
          puts "IDentifier : #{identifier}"
        end
      elsif identifier = chunk[/;/,1]
        parsed_tokens << [:NEWLINE , identifier]
        puts "IDentifier : #{identifier}"
      elsif setslot = chunk[/:=/,1]
        parsed_tokens << [:SETSLOT , identifier]
        puts "IDentifier : #{identifier}"
      end
      puts parsed_tokens.inspect
=end

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

    current_char = code[i]
    
    p "Input code : #{code}"
    while i < code.size
      chunk = code[i..-1]
      puts "#{i} - Reduce : #{chunk}"
      if identifier = chunk[/(\A[a-zA-z]\w*)/,1]
        puts "Identifier size: #{identifier} - #{identifier.size}"

        if KEYWORDS.include?(identifier)
          puts "Identifier : #{identifier}"
          parsed_tokens << [identifier.capitalize.to_sym , identifier]
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
        parsed_tokens << [:Number, identifier]
      elsif identifier = chunk[/\A\".+\"/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:String, identifier]
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


        if KEYWORDS.include?(identifier)
          puts "Identifier : #{identifier}"
          parsed_tokens << [:IDENTIFIER,identifier]
        elsif identifier = chunk[/\A(:=)/,1]
          puts "Identifier 3: #{identifier}"
          parsed_tokens << [:SETSLOT,identifier]
        elsif identifier = chunk[/\A\"(\S*)\"/,1]
          puts "Identifier 4: #{identifier}"
          parsed_tokens << [:STRING,identifier]
        elsif identifier = chunk[/\n/,1]
          puts "Identifier 4: #{identifier}"
          parsed_tokens << [:NEWLINE,identifier]
        end
      end
      if identifier.nil?
        i = i + 1
      else
        i = i + identifier.size
      end

=======================

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

=end

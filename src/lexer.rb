require_relative '../setup'

class Lexer
  attr_accessor :code
    
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

    puts "Input code : #{CodeRay.scan(code, :java).encode :terminal}"
    while i < code.size
      chunk = code[i..-1]
      paint("#{i} - Reduce : #{chunk}", :cyan)
      if identifier = chunk[/(\A[a-zA-z0-9]\w*)/,1]
        puts "Identifier size (#{identifier.size}): #{identifier}"

        if RESERVED_WORDS.include?(identifier)
          puts "Identifier : #{identifier}"
          parsed_tokens << [identifier.upcase.intern , identifier]
        else
          parsed_tokens << [:IDENTIFIER,identifier]
        end        
      elsif identifier = chunk[/\A\(/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:BRACKET_OPEN , identifier]
      elsif identifier =  chunk[/\A\)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:BRACKET_CLOSE , identifier]
      elsif identifier = chunk[/\A(:=)/,1]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:SETSLOT, identifier]
      elsif identifier = chunk[/\A([0-9])+/,1]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:NUMBER, identifier]
      elsif identifier = chunk[/\A\".+\"/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:STRING, identifier]
      elsif identifier = chunk[/\A(\n)+/m,1]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:NEWLINE,"\n"]
      elsif identifier = chunk[/\A(\+)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:PLUS, identifier]
      elsif identifier = chunk[/\A(\-)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:MINUS, identifier]
      elsif identifier = chunk[/\A(\*)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:ASTERISK, identifier]
      elsif identifier = chunk[/\A(\/)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:SLASH, identifier]
      elsif identifier = chunk[/\A(\&&)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:AND, identifier]
      elsif identifier = chunk[/\A(\|\|)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:OR, identifier]
      elsif identifier = chunk[/\A(\!)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:NOT, identifier]
      elsif identifier = chunk[/\A(\;)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:SEMICOLON, identifier]
      elsif identifier = chunk[/\A(\,)/]
        puts "Identifier : #{identifier}"
        parsed_tokens << [:COMMA, identifier]
      elsif identifier = chunk[/\A( )+/m]
        puts "Identifier : WHITESPACE"
        identifier = nil
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
    puts "Parsed Tokens : #{CodeRay.scan(parsed_tokens.inspect, :ruby).encode :terminal}"
    puts "Parsed Token Length  #{parsed_tokens.length}"
  end
end

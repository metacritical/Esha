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
      paint("Character No : #{i}", :cyan)
      paint("- Reduce : #{chunk}", :blue)
      case chunk
      when /(\A[[:alnum:]]\w*)/ then 
        RESERVED_WORDS.include?($&) ? parsed_tokens << [$&.upcase.intern , $&] : parsed_tokens << [:IDENTIFIER, $&]
        paint "Identifier : #{$&}", :red
      when /\A\(/       then parsed_tokens << [:BRACKET_OPEN,       $&]
        paint "Identifier : #{$&}", :red
      when /\A\)/       then parsed_tokens << [:BRACKET_CLOSE,      $&]
        paint "Identifier : #{$&}", :red
      when /\A([0-9])+/ then parsed_tokens << [:NUMBER ,            $&]
        paint "Identifier : #{$&}", :red
      when /\A\".+\"/   then parsed_tokens << [:STRING ,            $&]
        paint "Identifier : #{$&}", :red
      when /\A(\n)+/m   then parsed_tokens << [:NEWLINE,            $&]
        paint "Identifier : #{$&}", :red
      when /\A(\+)/     then parsed_tokens << [:PLUS,               $&]
        paint "Identifier : #{$&}", :red
      when /\A(\-)/     then parsed_tokens << [:MINUS,              $&]
        paint "Identifier : #{$&}", :red
      when /\A(\*)/     then parsed_tokens << [:ASTERISK,           $&]
        paint "Identifier : #{$&}", :red
      when /\A(\/)/     then parsed_tokens << [:SLASH,              $&]
        paint "Identifier : #{$&}", :red
      when /\A(\&&)/    then parsed_tokens << [:AND,                $&]
        paint "Identifier : #{$&}", :red
      when /\A(\|\|)/   then parsed_tokens << [:OR,                 $&]
        paint "Identifier : #{$&}", :red
      when /\A(\==)/    then parsed_tokens << [:COMPARISON,         $&]
        paint "Identifier : #{$&}", :red
      when /\A\!=/      then parsed_tokens << [:NOT_EQUALS,         $&]
        paint "Identifier : #{$&}", :red
      when /\A(\!)/     then parsed_tokens << [:NOT,                $&]
        paint "Identifier : #{$&}", :red
      when /\A\<=/      then parsed_tokens << [:LESSTHAN_EQUALS,    $&]
        paint "Identifier : #{$&}", :red
      when /\A\>=/      then parsed_tokens << [:GREATERTHAN_EQUALS, $&]
        paint "Identifier : #{$&}", :red
      when /\A(\<)/     then parsed_tokens << [:LESSTHAN,           $&]
        paint "Identifier : #{$&}", :red
      when /\A(\>)/     then parsed_tokens << [:GREATERTHAN,        $&]
        paint "Identifier : #{$&}", :red
      when /\A(\;)/     then parsed_tokens << [:SEMICOLON,          $&]
        paint "Identifier : #{$&}", :red
      when /\A(\,)/     then parsed_tokens << [:COMMA,              $&]
        paint "Identifier : #{$&}", :red
      when /\A(\:=)/    then parsed_tokens << [:SETSLOT,            $&]
        paint "Identifier : #{$&}", :red
      when /\A(\=)/     then parsed_tokens << [:UPDATESLOT,         $&]
        paint "Identifier : #{$&}", :red
      when /\A([[:blank:]])+/m    then identifier = nil
        paint "Identifier : WHITESPACE", :white
      end

      unless $&.nil?
        i += $&.size        
      else
        i += 1
      end
    end
    #End the token with false
    parsed_tokens << [false, false]
    
    #Tokenized Output
    puts "Parsed Tokens :\n #{CodeRay.scan(parsed_tokens.pretty_inspect, :ruby).encode :terminal}"
    puts "Parsed Token Length  #{parsed_tokens.length}"
    return parsed_tokens
  end
end

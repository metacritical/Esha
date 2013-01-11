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

    while i < code.size
      chunk = code[i..-1]
      
      case chunk
      when /(\A[[:alnum:]]\w*)/ then 
        RESERVED_WORDS.include?($&) ? parsed_tokens << [$&.upcase.intern , $&] : parsed_tokens << [:IDENTIFIER, $&]
        
      when /\A\(/       then parsed_tokens << [:BRACKET_OPEN,       $&]
        
      when /\A\)/       then parsed_tokens << [:BRACKET_CLOSE,      $&]
        
      when /\A([0-9])+/ then parsed_tokens << [:NUMBER ,            $&]
        
      when /\A\".+\"/   then parsed_tokens << [:STRING ,            $&]
        
      when /\A(\n)+/m   then parsed_tokens << [:NEWLINE,            $&]

      when /\A(\+)/     then parsed_tokens << [:PLUS,               $&]

      when /\A(\-)/     then parsed_tokens << [:MINUS,              $&]
        
      when /\A(\*)/     then parsed_tokens << [:ASTERISK,           $&]

      when /\A(\/)/     then parsed_tokens << [:SLASH,              $&]
        
      when /\A(\&&)/    then parsed_tokens << [:AND,                $&]
        
      when /\A(\|\|)/   then parsed_tokens << [:OR,                 $&]
        
      when /\A(\==)/    then parsed_tokens << [:COMPARISON,         $&]
        
      when /\A\!=/      then parsed_tokens << [:NOT_EQUALS,         $&]
        
      when /\A(\!)/     then parsed_tokens << [:NOT,                $&]
        
      when /\A\<=/      then parsed_tokens << [:LESSTHAN_EQUALS,    $&]
        
      when /\A\>=/      then parsed_tokens << [:GREATERTHAN_EQUALS, $&]
        
      when /\A(\<)/     then parsed_tokens << [:LESSTHAN,           $&]
        
      when /\A(\>)/     then parsed_tokens << [:GREATERTHAN,        $&]
        
      when /\A(\;)/     then parsed_tokens << [:SEMICOLON,          $&]

      when /\A(\,)/     then parsed_tokens << [:COMMA,              $&]
        
      when /\A(\:=)/    then parsed_tokens << [:SETSLOT,            $&]

      when /\A(\=)/     then parsed_tokens << [:UPDATESLOT,         $&]
        
      when /\A([[:blank:]])+/m    then identifier = nil
        
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
    return parsed_tokens
  end
end

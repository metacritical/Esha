class Lexer
  attr_accessor :code , :parsed_tokens , :offset , :token , :line
    
  #Initialize With Code
  def initialize(input_code)
    self.code = input_code
    sanitize
    reset_offset
    tokenize
  end
    
  def tokenize
    #List All Parsed Tokens
    self.parsed_tokens = []

    #Initialize loop variable i to zero
    i = 0

    current_char = code[i]
    while i < code.size
      chunk = code[i..-1]
      case chunk
        
      when /\A\d+\.\d+e\d+\.\d+|\A(\d+e\d+)|\A(\d+\.\d+e\d+)/
                                          then parsed_tokens << [:EXPONENT ,          $&, i , getline(i)]
        
      when /\A(\d+\.\d+)/                 then temp = $&
        if chunk[$&.size] =~ /[a-zA-Z]/
          if $& == 'e' and (chunk[temp.size.next] =~ /[0-9]/ || chunk[temp.size.next] == '-')
            parsed_tokens << [:EXPONENT , chunk[/\b\w*.+/] , i, getline(i)]
          else
            error! "Number does not respond to : '#{chunk[/[a-zA-Z]+\w*/]}' -> #{chunk[/\b\S+/]}" , :red , i
          end
        else
          parsed_tokens << [:NUMBER, temp, i, getline(i)]
        end

      when /\A\d+[a-zA-Z_]+|\A\d+\.[a-zA-Z_]+/ 
                                          then parsed_tokens << [:IDENTIFIER,         $&, i, getline(i)]

      when /\A([0-9])+/                   then parsed_tokens << [:NUMBER,             $&, i, getline(i)]

      when /(\A[[:alnum:]]\w*)/           then RESERVED_WORDS.include?($&) ? 

                                               parsed_tokens << [$&.upcase.intern ,   $&, i, getline(i)] 
                                          : 
                                               parsed_tokens << [:IDENTIFIER,         $&, i, getline(i)]

      when /\A\(/                         then parsed_tokens << [:BRACKET_OPEN,       $&, i, getline(i)]
        
      when /\A\)/                         then parsed_tokens << [:BRACKET_CLOSE,      $&, i, getline(i)]

      when /\A".+?"/m                     then parsed_tokens << [:SEQUENCE,           $&, i, getline(i)]

      when /\A(\n)+/m                     then parsed_tokens << [:NEWLINE,            $&, i, getline(i)]

      when /\A(\+)/                       then parsed_tokens << [:PLUS,               $&, i, getline(i)]

      when /\A(\-)/                       then parsed_tokens << [:MINUS,              $&, i, getline(i)]
        
      when /\A(\*)/                       then parsed_tokens << [:ASTERISK,           $&, i, getline(i)]

      when /\A(\%)/                       then parsed_tokens << [:MODULUS,            $&, i, getline(i)]

      when /\A(\/\/.+)/                   then nil #Single Line Comment

      when /\A\/\*(.+(\n))+(.)+\*\//      then nil #Multi  Line Comment

      when /\A[(\/)]/                     then parsed_tokens << [:SLASH,              $&, i, getline(i)]
        
      when /\A(\&&)/                      then parsed_tokens << [:AND,                $&, i, getline(i)]
        
      when /\A(\|\|)/                     then parsed_tokens << [:OR,                 $&, i, getline(i)]
        
      when /\A(\==)/                      then parsed_tokens << [:COMPARISON,         $&, i, getline(i)]
        
      when /\A\!=/                        then parsed_tokens << [:NOT_EQUALS,         $&, i, getline(i)]
        
      when /\A(\!)/                       then parsed_tokens << [:NOT,                $&, i, getline(i)]
        
      when /\A\<=/                        then parsed_tokens << [:LESSTHAN_EQUALS,    $&, i, getline(i)]
        
      when /\A\>=/                        then parsed_tokens << [:GREATERTHAN_EQUALS, $&, i, getline(i)]
        
      when /\A(\<)/                       then parsed_tokens << [:LESSTHAN,           $&, i, getline(i)]
        
      when /\A(\>)/                       then parsed_tokens << [:GREATERTHAN,        $&, i, getline(i)]
        
      when /\A(\;)/                       then parsed_tokens << [:SEMICOLON,          $&, i, getline(i)]

      when /\A(\,)/                       then parsed_tokens << [:COMMA,              $&, i, getline(i)]

      when /\A(\::=)/                     then parsed_tokens << [:GETTER_SETTER,      $&, i, getline(i)]
        
      when /\A(\:=)/                      then parsed_tokens << [:SETSLOT,            $&, i, getline(i)]

      when /\A(\=)/                       then parsed_tokens << [:UPDATESLOT,         $&, i, getline(i)]

      when /\A([[:blank:]])/              then temp = nil

      end

      unless $&.nil?
        i += $&.size        
       else
        temp ? i += temp.size : i += 1
      end
    end

    #End the token with false
    parsed_tokens << [false, false , false]
    
    #Tokenized Output
    return parsed_tokens
  end

  def reset_offset
    self.offset = 0
    self.token = []
  end

  def read_token
    reset_offset if offset > parsed_tokens.length #Reset offset if end of tokens is reached
    token = parsed_tokens[offset]
    self.offset = offset + 1 
    Token.new(token)
  end

  def look_ahead
    parsed_tokens[offset + 1] unless nil
  end

  #Private Error and Utility methods.    
  private 
  def error!(message , color , char_count)
    raise LexError, message rescue 
    paint("#{$!.class}\n-> #{$!.message} :: #{line char_count}" , color);exit
  end
  
  #Utility methods
  def getline(character)
    count = 0
    self.code.lines.each_with_index do |each,index|
      if index == 0  
        count = each.size    
      else    
        count = count + each.size    
        if count >= character
          return index + 1
        end  
      end  
    end  
  end
end

require_relative '../loader'

class Lexer
  attr_accessor :code , :parsed_tokens
    
  #Initialize With Code

  def initialize(input_code)
    self.code = input_code
    sanitize
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
                                          then parsed_tokens << [:EXPONENT ,          $&, i]
        
      when /\A(\d+\.\d+)/                 then temp = $&
        if chunk[$&.size] =~ /[a-zA-Z]/
          if $& == 'e' and (chunk[temp.size.next] =~ /[0-9]/ || chunk[temp.size.next] == '-')
            parsed_tokens << [:EXPONENT , chunk[/\b\w*.+/] , i]
          else
            error! "Number does not respond to : '#{chunk[/[a-zA-Z]+\w*/]}' -> #{chunk[/\b\S+/]}" , :red , i
          end
        else
          parsed_tokens << [:NUMBER, temp, i]
        end

      when /\A\d+[a-zA-Z_]+|\A\d+\.[a-zA-Z_]+/ 
                                          then parsed_tokens << [:IDENTIFIER,         $&, i]

      when /\A([0-9])+/                   then parsed_tokens << [:NUMBER,             $&, i]

      when /(\A[[:alnum:]]\w*)/           then RESERVED_WORDS.include?($&) ? 

                                               parsed_tokens << [$&.upcase.intern ,   $&, i] 
                                          : 
                                               parsed_tokens << [:IDENTIFIER,         $&, i]

      when /\A\(/                         then parsed_tokens << [:BRACKET_OPEN,       $&, i]
        
      when /\A\)/                         then parsed_tokens << [:BRACKET_CLOSE,      $&, i]

      when /\A".+?"/m                     then parsed_tokens << [:SEQUENCE,           $&, i]

      when /\A(\n)+/m                     then parsed_tokens << [:NEWLINE,            $&, i]

      when /\A(\+)/                       then parsed_tokens << [:PLUS,               $&, i]

      when /\A(\-)/                       then parsed_tokens << [:MINUS,              $&, i]
        
      when /\A(\*)/                       then parsed_tokens << [:ASTERISK,           $&, i]

      when /\A(\%)/                       then parsed_tokens << [:MODULUS,            $&, i]

      when /\A(\/\/.+)/                   then nil #Single Line Comment

      when /\A\/\*(.+(\n))+(.)+\*\//      then nil #Multi  Line Comment

      when /\A[(\/)]/                     then parsed_tokens << [:SLASH,              $&, i]
        
      when /\A(\&&)/                      then parsed_tokens << [:AND,                $&, i]
        
      when /\A(\|\|)/                     then parsed_tokens << [:OR,                 $&, i]
        
      when /\A(\==)/                      then parsed_tokens << [:COMPARISON,         $&, i]
        
      when /\A\!=/                        then parsed_tokens << [:NOT_EQUALS,         $&, i]
        
      when /\A(\!)/                       then parsed_tokens << [:NOT,                $&, i]
        
      when /\A\<=/                        then parsed_tokens << [:LESSTHAN_EQUALS,    $&, i]
        
      when /\A\>=/                        then parsed_tokens << [:GREATERTHAN_EQUALS, $&, i]
        
      when /\A(\<)/                       then parsed_tokens << [:LESSTHAN,           $&, i]
        
      when /\A(\>)/                       then parsed_tokens << [:GREATERTHAN,        $&, i]
        
      when /\A(\;)/                       then parsed_tokens << [:SEMICOLON,          $&, i]

      when /\A(\,)/                       then parsed_tokens << [:COMMA,              $&, i]

      when /\A(\::=)/                     then parsed_tokens << [:GETTER_SETTER,      $&, i]
        
      when /\A(\:=)/                      then parsed_tokens << [:SETSLOT,            $&, i]

      when /\A(\=)/                       then parsed_tokens << [:UPDATESLOT,         $&, i]

      when /\A([[:blank:]])/              then temp = nil

      end

      unless $&.nil?
        i += $&.size        
       else
        temp ? i += temp.size : i += 1
      end
    end

    #End the token with false
    parsed_tokens << [false, false]
    
    #Tokenized Output
    return parsed_tokens
  end
    
  private 
  def error!(message , color , char_count)
    raise LexError, message rescue 
    paint("#{$!.class}\n-> #{$!.message} :: #{line_finder char_count}" , color);exit
  end

  def line_finder(character)
    count = 0
    self.code.lines.each_with_index do |each,index|
      if index == 0  
        count = each.size    
      else    
        count = count+ each.size    
        if count >= character
          return "Line no: #{index + 1}"      
        end  
      end  
    end  
  end
end

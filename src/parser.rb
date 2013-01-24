class Parser
  attr_accessor :lexer , :current_token , :read_token , :look_ahead , :look_behind, :expressions #Expression stack

  def initialize(lexer)
    self.lexer = lexer
    self.expressions = []
  end

  def parse
    begin
      while read_token
        raise ParseError, "Parse Finished" if @read_token.type == false
        expressions << statement if statement
      end
    rescue => e
      code_inspect(expressions)
      code_print(e.message , :java)
    end
  end

  private
  def error!(message , tok_obj)
    raise ParseError, message rescue paint("#{message} :: #{tok_obj.line}", :red);exit
  end
  
  def check_type(tok_object)
    unless TOKENS.include? tok_object.type or RESERVED_WORDS.include? tok_object.value
      error! "Found #{tok_object.type} #{tok_object.value}, unexpected type error", tok_object
    end
  end

  def read_token
    self.current_token = self.read_token = lexer.read_token
  end
  
  def statement
    return stmt = 
      case look_ahead.type 
      when :SETSLOT    then setslot
      when :IDENTIFIER then identifier
      else
        if !RESERVED_WORDS.include? @read_token.value or !TOKENS.include? @read_token.type
          expression
        end
      end
  end
  
  def identifier
    check_type(current_token)
    unless current_token.eql?(:IDENTIFIER)
      read_token
    end
    AST::Identifier.new({ :left => look_behind, :right => look_ahead })
  end
  
  def setslot
    check_type(current_token)
    unless current_token.eql?(:SETSLOT)
      read_token
    end
    AST::Setslot.new({ :left => look_behind, :right => look_ahead })
  end
  
  def expression
    check_type(current_token)
    AST::Expression.new({ :expression => setslot })
  end

  def look_ahead
    lexer.look_ahead
  end
  
  def look_behind
    lexer.look_behind
  end
end


#Person := Object clone
=begin
AST::Setslot= 
  left= Person
  right= AST::identifier
         left= Object
         right= clone
=end

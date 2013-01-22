class Parser
  attr_accessor :lexer , :token , :read_token , :look_ahead , :expressions #Expression stack

  def initialize(lexer)
    self.lexer = lexer
    self.expressions = []
    self.read_token = read_token
  end

  def parse
    while @read_token
      expressions << statement if statement
      read_token
    end rescue nil
    puts expressions.pretty_inspect
  end

  private
  def error!(message , tok_obj)
    raise ParseError, message rescue paint("#{message} :: #{tok_obj.line}", :red);exit
  end
  
  def check_type(tok_object)
    error! "Found #{tok_object.type} #{tok_object.value}, unexpected type error", tok_obj unless TOKENS.include? tok_object.type
  end

  def read_token
    self.token = self.read_token = lexer.read_token
  end

  def statement
    return stmt = 
      case @read_token.type 
      when :IDENTIFIER then return identifier
      when :SETSLOT    then return setslot
      end
  end

  def setslot
    check_type(token)
    AST::Setslot.new({ :left => @token  , :right => look_ahead })
  end

  def identifier
    check_type(token)
    if look_ahead.type == :SETSLOT
      setslot
    else
      AST::Identifier.new({:left => @token  , :right => look_ahead})
    end
  end

  def look_ahead
    lexer.look_ahead
  end
end

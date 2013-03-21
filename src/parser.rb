class Parser
  attr_accessor :lexer , :current_token , :read_token , :look_ahead , :look_behind, :expressions , :tree_stack #Expression stack

  def initialize(lexer)
    self.lexer = lexer
    self.expressions = Array.new
    self.tree_stack = Array.new
  end

  def parse
    #code_inspect(lexer.read_token)
    while !look_ahead.type.eql?(false)
      read_token
      self.tree_stack << statement
    end
    self.expressions << self.tree_stack.pop
    code_inspect(self.expressions)
  end

  private
  def read_token
    self.current_token = self.read_token = lexer.read_token
  end
  
  def check_type(tok_object)
    unless TOKENS.include? tok_object.type or RESERVED_WORDS.include? tok_object.value
      error! "Found #{tok_object.type} #{tok_object.value}, unexpected type error", tok_object
    end
  end

  def error!(message , tok_obj)
    raise ParseError, message rescue paint("#{message} :: #{tok_obj.line}", :red);exit
  end
  
  def statement
    stmt = 
      case look_ahead.type
      when :SETSLOT    then setslot
      when :IDENTIFIER then identifier
      when :PLUS       then addition
      when :MINUS      then subtraction
      when :NUMBER     then binary_operation
      when :ASTERISK   then multiplication
      else
        if !RESERVED_WORDS.include? @read_token.value or !TOKENS.include? @read_token.type
          expression
        end
      end
  end

  def setslot
    check_type(current_token)
    unless current_token.eql?(:SETSLOT)
      read_token
    end
    AST::Setslot.new({ :left => look_behind, :right => look_ahead })
  end
  
  def identifier
    check_type(current_token)
    unless current_token.eql?(:IDENTIFIER)
      read_token
    end
    AST::Identifier.new({ :left => look_behind, :right => look_ahead })
  end
  
  def expression(type=nil)
    check_type(current_token)
    AST::Expression.new({ :expression => setslot })
  end

  def addition
    check_type(current_token)
    node = { :PLUS => AST::Addition }
    if current_token.type == :PLUS
      AST::Addition.new({:left => tree_stack.pop, :right => read_token})
    else
      read_token
      AST::Addition.new({:left => look_behind, :right => read_token})
    end
  end

  def subtraction
    check_type(current_token)
    node = { :MINUS => AST::Subtraction }
    if current_token.type == :MINUS
      AST::Subtraction.new({:left => tree_stack.pop, :right => read_token})
    else
      read_token
      AST::Subtraction.new({:left => look_behind, :right => read_token})
    end
  end

  def multiplication
    check_type(current_token)
    node = { :ASTERISK => AST::Multiplication }
    if current_token.type == :ASTERISK
      AST::Multiplication.new({:left => tree_stack.pop, :right => read_token})
    end
  end

  def look_ahead
    lexer.look_ahead
  end
  
  def look_behind
    lexer.look_behind
  end
  
  def binary_operation
    case current_token.type
    when :PLUS then addition
    when :MINUS then subtraction
    when :ASTERISK then multiplication
    end
  end
end


#Person := Object clone
=begin
AST::Setslot= 
  left= Person
  right= AST::identifier
         left= Object
         right= clone


1 + 2 + 3

AST::BinaryExpression=
=end

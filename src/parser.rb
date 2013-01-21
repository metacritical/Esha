class Parser
  attr_accessor :lexer , :token , :read_token , :look_ahead , :expressions #Expression stack

  def initialize(lexer)
    self.lexer = lexer
    self.expressions = []
  end

  def parse
    read_token
    unless look_ahead.nil?
      case look_ahead.type
      when :SETSLOT    then puts "Setslot"
      when :IDENTIFIER then setlabel
      end
    end
  end


  def read_token
    @read_token = lexer.read_token
    puts "Read Token : #{@read_token.inspect}"
    
    self.token = read_token
  end

  def setslot
    puts "If Reached here #{@token.inspect}"
    check_type(token)
    Setslot.new
  end

  def look_ahead
    lexer.look_ahead
  end

  private
  def error!(message , tok_obj)
    raise ParseError, message rescue paint("#{message} :: #{tok_obj.line}", :red);exit
  end
  
  def check_type(tok_object)
    error! "Found #{tok_object.type} #{tok_object.value}, unexpected type error", tok_obj unless TOKENS.include? tok_object.type
  end

  def statement
  end
end

class Parser
  attr_reader :expressions #Expression stack
  attr_accessor :lexer , :token , :read_token , :look_ahead

  def initialize(lexer)
    self.lexer = lexer
    self.expressions = []
  end

  def parse

  end

  private
  
  def read_token
    self.read_token = lexer.read_token
    self.token = read_token
  end

  def look_ahead
    lexer.look_ahead
  end

  def statement
    
  end
end

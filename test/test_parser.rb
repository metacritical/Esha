require_relative 'spec_helper'

describe Parser do
  before do
    def lexer
      @lexer = Lexer.new(simple_addition)
    end

    def parser
      @parser = Parser.new(lexer)
    end
  end
  
  it "should out an abstract syntax tree for the lexer input" do
    parser.parse
  end
end	 

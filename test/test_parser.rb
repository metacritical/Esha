require_relative '../setup'
require 'minitest/autorun'
require 'minitest/spec'
require_relative 'spec_helper'

describe Parser do
  before do
    def lexer
      @lexer = Lexer.new(test_code)
    end

    def parser
      #Pass lexer output into this.
    end
  end
  

  it "should out an abstract sntax tree for the lexer input" do
    skip
  end
end	 

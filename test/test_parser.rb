require_relative '../loader'
require_relative 'spec_helper'
require 'bundler'
Bundler.setup(:development)
require 'cucumber'
require 'minitest/autorun'
require 'minitest/spec'
require 'lexer'
require 'parser'

describe Parser do
  before do
    def lexer
      @lexer = Lexer.new(simple_code)
    end

    def parser
      @parser = Parser.new(lexer)
    end
  end
  
  it "should out an abstract syntax tree for the lexer input" do
    parser.parse
  end
end	 

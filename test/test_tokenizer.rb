require 'minitest/autorun'
require 'minitest/spec'
require_relative 'spec_helper'

describe Lexer do
  before do
    def lexer
      @lexer = Lexer.new
    end
  end
  
  it "should tokenize the given code" do
    lexer.tokenize( @test_code ).must_be_instance_of String
  end
end

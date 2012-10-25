require 'minitest/autorun'
require 'minitest/spec'
require_relative 'spec_helper'

describe Lexer do
  before do
    def lexer
      @lexer = Lexer.new(test_code)
    end
  end
  
  it "should check if the given code is an instance of string" do
    lexer.tokenize.must_be_instance_of String
  end

  it "should remove all newline \\n character" do 
    lexer.remove_new_line.match(/\n/)[0].wont_equal "\n"
  end

  it "should replace extra whitespaces from beginning of string" do
    lexer.remove_tail_spaces.first.wont_equal " "
  end
  
  it "should replace extra whitespaces from end of string" do
    lexer.remove_tail_spaces.last.wont_equal " "
  end

  #  it "should tokenize the given code" do
  #  end

end

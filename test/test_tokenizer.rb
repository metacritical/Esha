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
    self.lexer.code.must_be_instance_of String
  end
  
  it "should remove all newline \\n character" do 
    lexer.remove_new_line.scan(/\n/).first.wont_equal "\n" #skip "Need to see if we need to remove \\n later" 
  end

  it "should remove extra white space from inside the code" do 
    self.lexer.remove_white_space.scan(/\s+/).first.size.must_be :< , 2
  end
  
  it "should replace extra whitespaces from beginning of string" do
    self.lexer.remove_tail_spaces.match(/^\s/).must_be_nil
  end
  
  it "should replace extra whitespaces from end of string" do
    self.lexer.remove_tail_spaces.match(/\s+$/).must_be_nil
  end
  
  it "should tokenize the given code" do
    self.lexer.tokenize
  end
end

require_relative '../loader'
require 'bundler'
Bundler.setup(:development)
require 'cucumber'
require 'minitest/autorun'
require 'minitest/spec'
require_relative 'spec_helper'
require 'lexer'
require 'parser'


describe Lexer do
  before do
    def lexer
      @lexer = Lexer.new(test_code)
    end
  end
  
  it "should check if the given code is an instance of string" do
    self.lexer.code.must_be_instance_of String
  end
  
  it "should remove newline \\n character from beginning and end of string" do 
    lexer.remove_new_line.scan(/^(\n)+/).first.wont_equal "\n"
  end
  
  it "should replace extra whitespaces from beginning of string" do
    self.lexer.remove_tail_spaces.match(/^\s/).must_be_nil
  end
  
  it "should replace extra whitespaces from end of string" do
    self.lexer.remove_tail_spaces.match(/\s+$/).must_be_nil
  end
  
  it "should tokenize and output the given code" do
    puts "Input code : #{ code_print(test_code,:java) }"
    tokens = lexer.tokenize
    puts "Parsed Tokens :\n #{ code_print(tokens.pretty_inspect, :ruby) }"
    puts "Number of Tokens  #{tokens.length}"
  end

  it "should read token sequentially using read_token method" do
    lexer_instance = lexer
    total_tokens = lexer_instance.tokenize.size
    total_tokens.times{|count| puts "Count : #{count} : #{code_print(lexer_instance.read_token, :python) }" }
  end
end

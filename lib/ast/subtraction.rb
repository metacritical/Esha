module Io::AST
  class Subtraction < IOCore
    attr_accessor :left , :right
    
    def initialize(options={})
      options.each do |key,value|
        send "#{key}=",value
      end
    end

    def traverse
    end
  end
end

module Io::AST
  class Expression < IOCore
    attr_accessor :expression
    
    def initialize(options={})
      options.each do |key,value|
        send "#{key}=",value
      end
    end

    def traverse
    end
  end
end

module Io::AST
  class Identifier < IOCore
    attr_accessor :iden_name , :iden_value , :left , :right
    
    def initialize(options={})
      options.each do |key,value|
        send "#{key}=",value
      end
    end
    
    def traverse
    end
  end
end

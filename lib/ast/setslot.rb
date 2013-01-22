module Io::AST
  class Setslot < IOCore
    attr_accessor :slot_name , :slot_value , :left , :right
    
    def initialize(options={})
      options.each do |key,value|
        send "#{key}=",value
      end
    end

    def traverse
    end
  end
end

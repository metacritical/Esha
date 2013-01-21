module Io
  RESERVED_WORDS = 
    [
     'Object','Lobby','Protos', 'Number', 'File','String', 'Vector', 'Sequence', 'List', 'Map', 'Date', 'Socket', 
     'URL', 'Directory', 'Scheduler','System' , 'Networking', 'XML' , 'Future', 'Call', 'Coroutine', '(',
     ')', ':=', ',', 'clone', 'method', '+', '-', '*', '/','list','Exception','println', 'print', 'forward', 'exit',
     'do', 'if', 'at', 'return' , 'self', 'type','nil' ,'and', 'or', 'not'
    ]

  TOKENS = 
    [
     :IDENTIFIER, :NUMBER, :BRACKET_OPEN, :CURLY_BRACKET, :SQUARE_BRACKET, :BRACKET_CLOSE, :SEQUENCE, :NEWLINE, :PLUS,
     :MINUS, :ASTERISK, :MODULUS, :SLASH, :AND, :OR, :COMPARISON, :NOT_EQUALS, :NOT, :LESSTHAN_EQUALS, :GREATERTHAN_EQUALS,
     :LESSTHAN, :GREATERTHAN, :SEMICOLON, :COMMA, :GETTER_SETTER, :SETSLOT, :UPDATESLOT, :EXPONENT
    ]


  class Token
    attr_accessor :type , :value , :line , :column
    def initialize(token)
      self.type   = token[0]
      self.value  = token[1]
      self.column = token[2]
      self.line   = token[3]
    end
  end
end

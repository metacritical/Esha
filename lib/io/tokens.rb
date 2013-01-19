module Io
  RESERVED_WORDS = 
    [
     'Object','Lobby','Protos', 'Number', 'File','String', 'Vector', 'Sequence', 'List', 'Map', 'Date', 'Socket', 
     'URL', 'Directory', 'Scheduler','System' , 'Networking', 'XML' , 'Future', 'Call', 'Coroutine', '(',
     ')', ':=', ',', 'clone', 'method', '+', '-', '*', '/','list','Exception','println', 'print', 'forward', 'exit',
     'do', 'if', 'at', 'return' , 'self', 'type','nil' ,'and', 'or', 'not'
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

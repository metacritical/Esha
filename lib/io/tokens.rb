module Io
  RESERVED_WORDS = 
    [
     'Object','Lobby','Protos', 'Number', 'File','String', 'Vector', 'Sequence', 'List', 'Date', 'Socket', 
     'URL', 'Directory', 'Scheduler','System' , 'Networking', 'XML' , 'Future', 'Call', 'Coroutine', '(',
     ')', ':=', ',', 'clone', 'method', '+', '-', '*', '/','list','Exception','println', 'forward', 'exit',
     'do'
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

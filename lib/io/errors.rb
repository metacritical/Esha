module Io
  class Error < StandardError
  end
  
  class SyntaxError < Error
  end

  class LexError < Error
  end
end

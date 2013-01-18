module Io
  class IOError < StandardError
  end
  
  class SyntaxError < IOError
  end

  class LexError < IOError
  end
end

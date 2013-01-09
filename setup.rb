$LOAD_PATH << File.expand_path("../lib/",__FILE__)

require 'sanitize'
require 'tokens'

class Lexer
  include Sanitize
  include Io
end

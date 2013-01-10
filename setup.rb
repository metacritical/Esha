$LOAD_PATH << File.expand_path("../lib/",__FILE__)

require 'sanitize'
require 'tokens'
require 'coderay'
require 'colorprinter'
require 'pp'

class Lexer
  include Sanitize
  include Io
  include ColorPrinter
end

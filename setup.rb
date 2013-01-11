$LOAD_PATH << File.expand_path("../lib/",__FILE__)

require 'bundler/setup'
require 'sanitize'
require 'tokens'
require 'colorprinter'
require 'coderay'
require 'pp'

class Lexer
  include Sanitize
  include Io
  include ColorPrinter
end

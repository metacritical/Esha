["../lib/","../src/","../lib/io/"].each{ |dir| $LOAD_PATH << File.expand_path(dir,__FILE__) }

require 'bundler/setup'
require 'lexer'
require 'sanitize'
require 'tokens'
require 'errors'
require 'colorprinter'
require 'coderay'
require 'pp'

include ColorPrinter

class Lexer
  include Sanitize
  include Io
end

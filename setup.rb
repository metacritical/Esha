["../lib/","../src/","../lib/esha/"].each{ |dir| $LOAD_PATH << File.expand_path(dir,__FILE__) }

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

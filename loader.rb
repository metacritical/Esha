["../lib/","../src/","../lib/io/","../lib/ext/", "../lib/ast/"].each{ |dir| $LOAD_PATH << File.expand_path(dir,__FILE__) }

require 'bundler/setup'
require 'lexer'
require 'parser'
require 'ast'
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

class Parser
  include Io
end

$LOAD_PATH << File.expand_path("../lib/",__FILE__)

require 'sanitize'
require 'tokens'
require 'coderay'
require 'camouflage'
require 'paint'

class Lexer
  include Sanitize
  include Io
  include Camouflage
end

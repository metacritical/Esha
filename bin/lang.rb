require_relative "../src/lexer"
lexer = Lexer.new(%q{person := Object clone
                      a := 1
                      b := 2
                      a + b
                      }).tokenize

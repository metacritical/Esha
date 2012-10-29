require_relative "../src/lexer"
lexer = Lexer.new(%q{Person := Object clone
                      a := 1
                      b := 2
                      a + b
                      Person name := method("pankaj")
                      }).tokenize

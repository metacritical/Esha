require_relative '../src/lexer'

def test_code
  @test_code = %q{Person := Object clone
                  a := 1
                  b := 2
                  a + b
                  Person name := method("pankaj")
                }
end

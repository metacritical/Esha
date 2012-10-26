require_relative '../src/lexer'

def test_code
  @test_code = %q{
                  person := Object clone
                  a := 1
                  b := 2
                  a + b
                }
end

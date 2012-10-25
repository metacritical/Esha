require_relative '../src/lexer'

def test_code
  @test_code = <<-code
                  person := Object clone
                  code
end

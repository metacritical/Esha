require_relative '../src/lexer'

def test_code
  %Q{
  Person := Object clone;
  a := 1;
  b := 2;
  a + b;
  Person name := method("pankaj");
  list(1,2,3,4);
  d := 4;
  d - c
  -a+b*c/d;
  Car := Object clone
  a = "Poltergiest"
  3 == 2
  3 <= 2
  3 >= 2
  3 != 2
  3 > 2
  3 < 2
  property1 := "Ferrari"
  }
end


=begin
#A thought on how to design the objects in the tree
<IO:AST:Setslot>
  @left= Person
  @right = 
     <IO:AST:Clone>
        @value=<Object>
=end

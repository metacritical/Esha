require_relative '../src/lexer'

def test_code
  %Q{
  3 == 2
  3 <= 2
  3 >= 2
  3 != 2
  3 >  2
  3 <  2
  a || b
  e2l2 == "punk"
  3yoda = 1skywalker
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
  property1 := "Ferrari"
  4yoda := Object clone
  whois := 4yoda method("yoda is the master of arts" println)
  ///123.1der_land
  123.woot
  //This is a comment
  e := 457.234
  f := 100123123456
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

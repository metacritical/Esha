def test_code
  %Q{
  3 == 2
  3 <= 2
  3 >= 2
  3 != 2
  3 >  2
  3 <  2
  a || b
  R2D2 == "skybot"
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
  force = "Poltergiest"
  zen := "Let the force be with you"

  /* this is a multi line 
     comment, which is damn easy
     stuff to capture in regexp,
     i wonder why people are afraid 
     of regexp.
  */

  321.der_land
  ///123.1der_land //Introduce Lexer Error by uncommenting
  123.der_land
  4yoda := Object clone
  whois := 4yoda method("yoda the master of arts" println)
  //This is a comment
  e := 457.234
  f := 100123123456
  2e51
  3.2e5
  2.3e4.6
  ///123.1derland := Number clone
  123.woot
  Complex := Object Clone do(
    real ::= 0
    imag ::= 0
  )
  7%2
  -2.3e2
  -2.7e-2.1
  4.6e-2
  "io is the master of mystery"
  "Wishfull thinking\n may lead \nto self deception\n"
  "\nparsing is\n ubiquitous\n - martin trevor\n"
  1 + 2 + 3 * 6
  1 + 2 + (3 * 6)
  if( a == 1, writeln("a is one"), writeln("a is not one") )
  Person := Object clone
  }
end

def simple_code
  %Q{Person := Object clone}
end



=begin
#A thought on how to design the objects in the tree
<IO:AST:Setslot>
  @left= Person
  @right = 
     <IO:AST:Clone>
        @value=<Object>
=end

require_relative "../src/lexer"
lexer = Lexer.new(%q{  
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
  f := 100_123_123
}).tokenize

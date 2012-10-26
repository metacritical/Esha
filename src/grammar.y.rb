#IO grammar for racc

class IOParser
  token 'Object' MESSAGE

  prechigh
   nonassoc UMINUS
   left '*' '/'
   left '-' '+'
  preclow

  rule
    exp: exp '+' exp { result += val[2] }
       | exp '-' exp { result -= val[2] }
       | exp '*' exp { result *= val[2] }
       | exp '/' exp { result /= val[2] }

end

  
end

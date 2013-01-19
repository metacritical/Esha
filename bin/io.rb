require_relative "../loader"

unless ARGV[0].nil?
  begin
    raise Errno::ENOENT unless code = File.read(ARGV[0]) 
    lexer = Lexer.new(code)
    puts lexer.pretty_inspect
  rescue => e
    paint(e.message, :red)
  end
else
  paint("~= No Input File Provided =~", :blue)
end

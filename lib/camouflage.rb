module Camouflage
  ANSI_COLOR_CODES = {
    :black   => 0,
    :red     => 1,
    :green   => 2,
    :yellow  => 3,
    :blue    => 4, 
    :magenta => 5,
    :cyan    => 6,
    :white   => 7,
    :primary => 9,
  }

  ANSI_TERMINATOR = "\e[0m"

  def paint(string, color)
    print "\e[3#{ANSI_COLOR_CODES[color]}m#{string}#{ANSI_TERMINATOR}"
  end	
end

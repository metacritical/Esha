module ColorPrinter
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

  RENDITION_EFFECTS = {
    :bright    => 1,
    :underline => 4,
    :color256  => 38, #Next arguments are ;5;x where x is color index (0..255) {For rgb, 256 term colors}
  }
  
  ANSI_ESC        = "\e["
  ANSI_FOREGRND   = ";3"
  ANSI_BACKGRND   = ";4" #Not Used Now May Be will Extend in future if required.
  ANSI_RESET      = "\e[0m"

  def paint(input, color)
    print color_string(input, :red)
  end	
  
  def code_print(message, lang)
    print CodeRay.scan(message, lang).encode(:terminal)
  end

  def color_string(string, color)
    "#{ANSI_ESC}#{RENDITION_EFFECTS[:bright]}#{ANSI_FOREGRND}#{ANSI_COLOR_CODES[color]}m#{string}#{ANSI_RESET}"
  end

  def code_inspect(object)
    print object.pretty_inspect
      .gsub(/\#.+\:\:\w*/){|match| color_string(match,:red) }
      .gsub(/\@\w*/){|match| color_string(match,:white) }
      .gsub(/\".+?\"/){|match| color_string(match,:yellow) }
      .gsub(/\:.+?\w*/){|match| color_string(match,:blue) }
      .gsub(/\=/){|match| color_string(match,:magenta) }
      .gsub(/\>/){|match| color_string(match,:red) }
  end
end

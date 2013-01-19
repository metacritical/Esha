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
    :color256  => 38, #next arguments are ;5;x where x is color index (0..255) {For rgb, 256 term colors}
  }

  ANSI_ESC        = "\e["
  ANSI_FOREGRND   = ";3"
  ANSI_BACKGRND   = ";4" #Not Used Now May Be will Extend in future if required.
  ANSI_RESET      = "\e[0m"

  def paint( input, color )
    puts "#{ANSI_ESC}#{RENDITION_EFFECTS[:bright]}#{ANSI_FOREGRND}#{ANSI_COLOR_CODES[color]}m#{input}#{ANSI_RESET}"
  end	
end

module Io
  module AST
    class IOCore
      def initialize(args)
        Hash[args]
      end
    end

    Dir.glob File.expand_path("../ast/*", __FILE__) do |file|
      require file
    end
  end
end

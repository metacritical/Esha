namespace :io do
  namespace :test do
    task :lexer do
		  desc "Test IO Tokenizer and Lexer"
      system "ruby test/test_tokenizer.rb"
    end
		
    task :parser do
      desc "Test Parser AST and lexer look_ahead methods"
      system "ruby test/test_parser.rb"
    end
  end

	task :all => ['io:test:lexer', 'io:test:parser']
end

desc "Run All Tasks"
task :io => 'io:all'

desc "Run Lexer Tests"
task 'test:lexer' => 'io:test:lexer'

desc "Run Parser Tests"
task 'test:parser' => 'io:test:parser'

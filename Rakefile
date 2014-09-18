namespace :io do
  namespace :test do
    desc "Test IO Tokenizer and Lexer"
    task :lexer do
      system "ruby test/test_tokenizer.rb"
    end
		
    desc "Test Parser AST and lexer look_ahead method"
    task :parser do
      system "ruby test/test_parser.rb"
    end
    
    task :all => ['io:test:lexer', 'io:test:parser']
  end
end

desc "Run all tests"
task :default => 'io:test:all'

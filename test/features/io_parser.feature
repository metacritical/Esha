Feature: Io language Parser
  In Order to generate a parse tree (AST) from a given expression.
  The parser should take a lexical input and generate a generate a parse tree

Background:
  Given the expression to be parsed is already lexed using a lexer

Scenario: Run Parser and generate AST
  When I input an Lexed Io expression "Person := Object clone"
  Then I should get 
     """
					@left=
					 #<Io::Token:0x98893d0
						@column=5,
						@line=2,
						@type=:IDENTIFIER,
						@value="Person">,
					@right=
					 #<Io::Token:0x9889290
						@column=5,
						@line=2,
						@type=:IDENTIFIER,
						@value="Person">>,
				 #<Io::AST::Setslot:0x988909c
					@left=
					#<Io::Token:0x98891b4 @column=12, @line=2, @type=:SETSLOT, @value=":=">,
					@right=
					#<Io::Token:0x98890c4 @column=12, @line=2, @type=:SETSLOT, @value=":=">>
		"""



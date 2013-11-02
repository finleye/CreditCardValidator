# Corey Finley
# 1 November 2013
# file_parser_test.rb

require_relative "../lib/file_parser"
require "test/unit"
 
class TestRecord < Test::Unit::TestCase
	def setup
		@file_name = "input.txt"
		@parser = FileParser.new(@file_name)
	end

	# test init and contents reader
	def test_init
		expected_contents = ["4111111111111111",
			"4111111111111",
			"4012888888881881",
			"378282246310005",
			"6011111111111117",
			"5105105105105100",
			"5105 1051 0510 5106",
			"9111111111111111"]

		assert_equal(@file_name, @parser.file_name)
		assert_equal(expected_contents, @parser.contents)
	end
end
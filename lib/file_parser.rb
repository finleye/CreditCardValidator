# Corey Finley
# 1 November 2013
# file_parser.rb

# This class will read in lines from the input file, and seperate them into
# a collection of lines.

class FileParser
	attr_accessor :file_name, :contents

	def initialize(file)
		@file_name = file
		@contents = self.read_contents
	end

	# open the file, split its contents at line breaks and return the collection of lines
	def read_contents
		return File.open(self.file_name).read.split(/\n/) if self.file_name
	end
end
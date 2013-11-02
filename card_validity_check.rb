#!/usr/bin/env ruby

# Corey Finley
# 1 November 2013
# card_validity_check.rb

# This script can take numbers from a text file
# or accept numbers from the command line. These numbers
# are used to create a CreditCard object, then print out
# the information about the card. (type, number, and validity)

# require needed clases
require './lib/credit_card.rb'
require './lib/file_parser.rb'

# check for missing arguments
unless (ARGV[0] == "-i" || ARGV[0] == "-n") && !ARGV[1].nil?
	puts "Usage: ruby card_validity_check.rb [option] [arguments]"
	puts "          -i [file name]     input text file of card numbers"
	puts "          -n [numbers]       any number of card numbers seperated by spaces"
	exit
end

# get file name from command line if given the -i flag
@file = ARGV[1] if ARGV[0] == "-i"
@credit_cards = Array.new

# given the -n flag, pull each number from the command line for processing
if ARGV[0] == "-n"
	ARGV.each do |number|
		@credit_cards << CreditCard.new(number) if number.to_i > 0
	end
end

# create new FileParser with the file name to read in card numbers
if @file
	FileParser.new(@file).contents.each do |number|
		@credit_cards << CreditCard.new(number) if number.to_i > 0
	end
end

unless @credit_cards.empty?
	# set format for printing
	format="%10s\t%16s\t%10s\n"
	printf(format, "Type", "Number", "Validity")
	printf(format, "----------", "----------------", "--------")

	# print each cards information into the table
	@credit_cards.each do |card|
		printf(format, card.type, card.number, card.validity)
	end
end
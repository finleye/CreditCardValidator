# card_test.rb

require_relative "../lib/credit_card"
require "test/unit"
 
class TestRecord < Test::Unit::TestCase
	def test_init
		card_number = "4111111111111111"
		card = CreditCard.new(card_number)
		assert_equal(card_number, card.number)
	end

	def test_trim
		card = CreditCard.new("234 234 234")
		assert_equal("234234234", card.number)
	end

	# Sample data for test cases
	# VISA: 4111111111111111       (valid)
	# VISA: 4111111111111          (invalid)
	# VISA: 4012888888881881       (valid)
	# AMEX: 378282246310005        (valid)
	# Discover: 6011111111111117   (valid)
	# MasterCard: 5105105105105100 (valid)
	# MasterCard: 5105105105105106 (invalid)
	# Unknown: 9111111111111111    (invalid)

	def test_type_visa
		card_number = "4111111111111111"
		card = CreditCard.new(card_number)
		assert_equal("VISA", card.type)
	end

	def test_type_amex
		card_number = "378282246310005"
		card = CreditCard.new(card_number)
		assert_equal("AMEX", card.type)
	end

	def test_type_discover
		card_number = "6011111111111117"
		card = CreditCard.new(card_number)
		assert_equal("Discover", card.type)
	end

	def test_type_master_card
		card_number = "5105105105105100"
		card = CreditCard.new(card_number)
		assert_equal("MasterCard", card.type)
	end

	def test_type_unknown
		card_number = "9111111111111111"
		card = CreditCard.new(card_number)
		assert_equal("Unknown", card.type)
	end

	def test_valid
		valid_card = CreditCard.new("378282246310005")
		assert_equal(true, valid_card.valid?)
		invalid_card = CreditCard.new("5105105105105106")
		assert_equal(false, invalid_card.valid?)
	end
end
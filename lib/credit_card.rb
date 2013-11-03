# Corey Finley
# 1 November 2013
# credit_card.rb

# This class creates a CreditCard object from a number, 

class CreditCardArgumentError < ArgumentError; end

class CreditCard
	attr_accessor :number, :type, :validity

	def initialize(card_number)
		raise CreditCardArgumentError, "Expecting String got #{card_number.class}" if card_number.class != String
		raise CreditCardArgumentError, "Card Number empty" if card_number.length == 0
		# save the number and remove all whitespace
		@number = card_number.tr(' ', '')
		@type = self.type
		@validity = "valid" if self.valid?
		@validity ||= "invalid"
	end
	
	# match number patern to recognize type
	# +============+=============+===============+
	# | Card Type  | Begins With | Number Length |
	# +============+=============+===============+
	# | AMEX       | 34 or 37    | 15            |
	# +------------+-------------+---------------+
	# | Discover   | 6011        | 16            |
	# +------------+-------------+---------------+
	# | MasterCard | 51-55       | 16            |
	# +------------+-------------+---------------+
	# | Visa       | 4           | 13 or 16      |
	# +------------+-------------+---------------+

	# test strings by regular expression
	def type
		if self.number =~ /\A4(([0-9]{15})|([0-9]{12}))$/
			return "VISA"
		elsif self.number =~ /\A(37|34)[0-9]{13}$/
			return "AMEX"
		elsif self.number =~ /\A6011[0-9]{12}$/
			return "Discover"
		elsif self.number =~ /\A5[1-5][0-9]{14}$/
			return "MasterCard"
		else
			return "Unknown"
		end
	end

	# Test the validity of a credit card number.
	# Reverse the string number, and then process every other number
	# by doubling it. Add each number to the sum, if the number is 
	# greater than 9, split it into it's to parts (i.e. 17 -> 1+7)
	# return the boolean evaluation of the sum mod ten equaling zero

	def valid?
		return false if self.number.length <= 12

		sum = 0
		self.number.reverse.split("").each_with_index do |digit, i|
			digit = digit.to_i

			# only alter every other digit, starting from the second item
			if (i+1)%2==0
				digit = digit*2
				digit = (digit%10) + ((digit-(digit%10))/10) if digit > 9
			end

			sum += digit
		end

		return sum%10==0
	end
end
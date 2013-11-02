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

	def type
		# check lengths first
		# then first digits to find type
		if self.number.length == 16
			if self.number[0..3] == "6011"
				return "Discover"
			elsif self.number[0..1] == "51" || self.number[0..1] == "55"
				return "MasterCard"
			elsif self.number[0] == "4"
				return "VISA"
			else
				return "Unknown"
			end
		elsif self.number.length == 15
			if self.number[0..1] == "34" || self.number[0..1] == "37"
				return "AMEX"
			else
				return "Unknown"
			end
		elsif self.number.length == 13
			if self.number[0] == "4"
				return "VISA"
			else
				return "Unknown"
			end
		else
			return "Unknown"
		end
	end

	# test the validity of a credit card number
	# reverse the string number, and then process every other number
	# by doubling it. Add each number to the sum, if the number is 
	# greater than 9, split it into it's to parts (i.e. 17 -> 1+7)
	# return the boolean evaluation of the sum mod ten equaling zero

	def valid?
		# According to Wikipedia, the smallest valid bank number is 13 digits
		# so if the length is shorter than 13, then don't bother processing it
		return false if self.number.length <= 12

		sum = 0

		# take the string number, reverse it, and then split it into 
		# a collection of string digits for processing
		self.number.reverse.split("").each_with_index do |digit, i|

			# convert the string digit to an integer
			digit = digit.to_i

			# act on every other digit, starting from the second 
			if (i+1)%2==0
				digit = digit*2 
				
				# if the digit is greater than 9 split it into to integers, 
				# otherwise just add it to the sum
				digit = (digit%10) + ((digit-(digit%10))/10) if digit > 9
				sum += digit
			else
				# if the number does not need to be doubled just add it to the sum
				sum += digit
			end
		end

		# return the boolean evaluation of sum mod ten equaling zero
		return sum%10==0
	end
end
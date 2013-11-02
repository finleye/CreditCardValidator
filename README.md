CreditCardValidator
===================

A script to validate credit card numbers and match their type based on the Luhn Algorithm and expected patterns of beginning digits.

Prompt for assignment found here: https://gist.github.com/evs/6ca21baf77a47d72b23c

The script was developed on OS X Version 10.9 using
'''
ruby 2.0.0p195 (2013-05-14 revision 40734) [x86_64-darwin12.4.0]
'''

Usage
=====
'''
ruby card_validity_check.rb [option] [arguments]
          -i [file name]     input text file of card numbers
          -n [numbers]       any number of card numbers seperated by spaces
'''
Example of usage, running sample data
'''
ruby card_validity_check.rb -i ./sample_data/input.txt
'''

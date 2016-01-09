# CreditCard class that handles type parsing and validation
class CreditCard
  attr_accessor :number

  def initialize(card_num)
    bad_argument_type(card_num) if card_num.class != String
    empty_argument if card_num.length == 0

    @number = card_num.gsub(/\s+/, '')
  end

  def type
    providers = {
      'VISA' => /^4((\d{15})|(\d{12}))$/,
      'AMEX' => /^(37|34)\d{13}$/,
      'Discover' => /^6011\d{12}$/,
      'MasterCard' => /^5[1-5]\d{14}$/
    }

    providers.each do |provider, pattern|
      return provider if @number =~ pattern
    end

    'Unknown'
  end

  def valid?
    return false if @number.length <= 12

    num_array = @number.reverse.split('').map(&:to_i)

    num_array.each.with_index.inject(0) do |sum, (num, index)|
      sum + ((index).odd? ? double_and_split(num) : num)
    end % 10 == 0
  end

  private

  def double_and_split(num)
    num *= 2
    num >= 10 ? num.to_s.split('').map(&:to_i).inject(:+) : num
  end

  def bad_argument_type(klass)
    fail ArgumentError, "Expecting String got #{klass}"
  end

  def empty_argument
    fail ArgumentError, 'Card Number empty' if card_num.length == 0
  end
end

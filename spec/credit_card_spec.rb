require 'rspec'
require 'credit_card'
require 'ostruct'

RSpec.describe CreditCard do
  sample_data = [
    OpenStruct.new(type: "VISA",       number: "4111111111111111", valid: true),
    OpenStruct.new(type: "VISA",       number: "4111111111111",    valid: false),
    OpenStruct.new(type: "VISA",       number: "4012888888881881", valid: true),
    OpenStruct.new(type: "AMEX",       number: "378282246310005",  valid: true),
    OpenStruct.new(type: "Discover",   number: "6011111111111117", valid: true),
    OpenStruct.new(type: "MasterCard", number: "5105105105105100", valid: true),
    OpenStruct.new(type: "MasterCard", number: "5105105105105106", valid: false),
    OpenStruct.new(type: "Unknown",    number: "9111111111111111", valid: false),
  ]

  sample_data.each do |sample_point|
    it "should read #{sample_point.type} as #{"in" if sample_point.valid}valid" do
      card = CreditCard.new(sample_point.number)
      expect(card.type).to eq sample_point.type
      expect(card.valid?).to eq sample_point.valid
    end
  end

  it "should throw errors for invalid input" do
    expect{CreditCard.new(12345)}.to raise_error ArgumentError
  end
end

require 'rspec'
require 'file_parser'

RSpec.describe FileParser do
  let(:file_name) { "./spec/fixtures/input.txt" }
  let(:parser) { FileParser.new(file_name) }
  let(:expected_contents) do
		[ "4111111111111111",
			"4111111111111",
			"4012888888881881",
			"378282246310005",
			"6011111111111117",
			"5105105105105100",
			"5105 1051 0510 5106",
			"9111111111111111"]
  end

  it "should read file contents" do
    expect(parser.contents).to eq expected_contents
  end
end

require './lib/file_parser'
require './lib/credit_card'
require 'rake'

namespace :validate do
  desc "Validate text file contents"
  task :text_file do
    file_path = ENV["FILE"]
    file_reader = FileParser.new(file_path)

    format="%-30s\t%-15s\n"
    printf(format, "\nCard Information", "Validity")
    printf(format, "----------------------------", "---------")

    file_reader.contents.each do |card_num|
      card = CreditCard.new(card_num)

      printf(format, "#{card.type}: #{card.number}", "(#{card.valid? ? "valid" : "invalid"})")
    end
  end
end

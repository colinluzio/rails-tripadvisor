require 'showtime_helper.rb'

RSpec.describe ShowtimeHelper do
  
   it "sums the pin count for each roll" do
   timeExpression = ShowtimeHelper.new
   timeExpression.format_time(22)
   expect(bowling.score).to eq 80
  end
end
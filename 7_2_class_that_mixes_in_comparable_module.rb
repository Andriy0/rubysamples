class Bid
  include Comparable

  attr_accessor :estimate

  def <=>(other_bid)
    estimate <=> other_bid.estimate
  end
end

bid1 = Bid.new
bid2 = Bid.new
bid3 = Bid.new
bid1.estimate = 100
bid2.estimate = 105
bid3.estimate = 103
puts bid1 < bid2
puts bid3.between?(bid1, bid2)

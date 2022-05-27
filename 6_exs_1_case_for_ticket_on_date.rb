class Ticket
  attr_accessor :venue, :date

  def initialize(venue, date)
    self.venue = venue
    self.date = date
  end

  def ===(other_ticket)
    date == other_ticket.date
  end
end

ticket1 = Ticket.new 'Town Hall', '07/08/18'
ticket2 = Ticket.new 'Conference Center', '07/08/18'
ticket3 = Ticket.new 'Town Hall', '08/09/18'

case ticket1
when ticket2
  puts 'Same date as ticket2!'
when ticket3
  puts 'Same date as ticket3!'
else
  puts 'No match.'
end

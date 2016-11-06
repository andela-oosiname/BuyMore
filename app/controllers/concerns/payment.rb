class Payment
  def initialize
    require "pry"; binding.pry

    response = RestClient.get(url)
    result = JSON.parse(response)
  end

  def pay
    values = {
      business: "oluosiname-facilitator@yahoo.com",
      cmd: "_cart",
      upload: 1,
      return:  success_bookings_url(id: booking.id),
      invoice: booking.ref
    }

    booking.passengers.each_with_index do |passenger, index|
      values["amount_#{index + 1}"] = convert(passenger.cost)
      values["item_name_#{index + 1}"] = passenger.name
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end


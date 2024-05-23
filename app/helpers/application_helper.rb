module ApplicationHelper
  def greet
    now = Time.now
    today = Date.today.to_time

    morning = today.beginning_of_day
    noon = today.noon
    evening = today.change( hour: 17 )
    night = today.change( hour: 20 )
    tomorrow = today.tomorrow

    if (morning..noon).cover? now
      'Good Morning'
    elsif (noon..evening).cover? now
      'Good Afternoon'
    elsif (evening..night).cover? now
      'Good Evening'
    elsif (night..tomorrow).cover? now
      'Good Night'
    end
  end

  def to_peso(price)
    number_to_currency(price, unit: "₱", format: "%u %n")
  end

  def bid_placed?(product_id)
    current_user.bids.pluck(:product_id).include? product_id
  end
end

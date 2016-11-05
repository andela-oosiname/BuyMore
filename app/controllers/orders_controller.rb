class OrdersController < ApplicationController
  def new
    @cart = convert_cart_session_to_hash
    items = @cart.values

    total_amount = items.inject(0) { |sum, item| sum + (item[:amount].to_f * item[:quantity]) }
    order = Order.new(
        order_no: SecureRandom.hex(8),
        customer_id: current_user.id,
        total: total_amount.to_f,
        date: DateTime.now
      )

    if order.save!
      @cart.each_pair do |key, item|
        order_line = order.order_lines.new(
          product_id: key.to_i, qty: item["quantity"],
          unit_price: item["amount"],
          total_price: (item[:amount].to_f * item[:quantity])
        )
        order_line.save!
      end
    end

    session.delete(:cart)
    return redirect_to root_path
  end

  def create_order_and_lines
  end

  def index
    @orders = current_user.orders.order("date DESC").includes("order_lines")
  end

  def convert_cart_session_to_hash
    cart = session[:cart] ? JSON.parse(session[:cart]) : {}
    cart.with_indifferent_access
  end

end

class OrdersController < ApplicationController
  def new
    if params[:success] == "true"
      register_order
    else
      redirect_to cart_index_path
      flash["notice"] = "Payment Was Unsuccessful"
    end


    session.delete(:cart)
  end

  def index
    @orders = current_user.orders.order('date DESC').includes('order_lines')
  end

  def register_order
    @cart = convert_cart_session_to_hash
    items = @cart.values

    total_amount = items.inject(0) { |sum, item| sum + (item[:amount].to_f * item[:quantity]) }
    order = Order.new(
      order_no: params[:order_no],
      customer_id: current_user.id,
      total: total_amount.to_f,
      date: DateTime.now
    )

    if order.save!
      @cart.each_pair do |key, item|
        order_line = order.order_lines.new(
          product_id: key.to_i, qty: item['quantity'],
          unit_price: item['amount'],
          total_price: (item[:amount].to_f * item[:quantity])
        )
        order_line.save!
      end
    end

    flash["notice"] = "Payment Was Successful. Your Order Is on its Way"
    return redirect_to orders_path
  end

  def convert_cart_session_to_hash
    cart = session[:cart] ? JSON.parse(session[:cart]) : {}
    cart.with_indifferent_access
  end
end

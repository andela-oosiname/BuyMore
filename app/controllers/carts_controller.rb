class CartsController < ApplicationController
  def index
    @cart = convert_cart_session_to_hash

    items = @cart.values

    @total_amount = items.inject(0) { |sum, item| sum + (item[:amount].to_f * item[:quantity]) }
  end

  def add_item
    # session.delete(:cart)


    product = Product.find_by(id: params[:product_id])

    item_hash = { amount: product.price.to_f, quantity: params[:quantity].to_f,  name: product.name}

    cart = convert_cart_session_to_hash

    if cart && cart.key?(params[:product_id])
      cart[params[:product_id]][:quantity] += params[:quantity].to_f
    else
      cart[params[:product_id]] = item_hash
    end

    # require "pry"; binding.pry
    set_session_and_response(cart)
  end

  def remove_item
    # require "pry"; binding.pry
     cart = convert_cart_session_to_hash

    if cart && cart.key?(params[:id])
      cart.delete(params[:id])
    end

    set_session_and_response(cart)
  end

  def convert_cart_session_to_hash

    cart = session[:cart] ? JSON.parse(session[:cart]) : {}
    cart.with_indifferent_access
  end

  def set_session_and_response(cart)
    items = cart.values

    @total_amount = items.inject(0) { |sum, item| sum + (item[:amount].to_f * item[:quantity]) }
    @size = cart.size
    @items = cart


    session[:cart] = JSON.generate(cart)

    respond_to do |format|
      format.js
    end
  end

  def item_params
    {
      item_id: params[:product_id],
      quantity: params[:quantity].to_i
    }
  end
end


class CartsController < ApplicationController
  def index
    @cart = convert_cart_session_to_hash

    items = @cart.values

    @total_amount = items.inject(0) { |sum, item| sum + (item[:amount].to_f * item[:quantity]).round(2) }
  end

  def add_item
    product = Product.find_by(id: params[:product_id])

    item_hash = { amount: (product.price.to_f).round(2), quantity: params[:quantity].to_i,  name: product.name}

    cart = convert_cart_session_to_hash

    if cart && cart.key?(params[:product_id])
      cart[params[:product_id]][:quantity] += params[:quantity].to_i
    else
      cart[params[:product_id]] = item_hash
    end

    set_session_and_response(cart)
  end

  def remove_item

    cart = convert_cart_session_to_hash

    # require "pry"; binding.pry
    if cart && cart.key?(params[:id])
      cart.delete(params[:id])
    end

    set_session_and_response(cart)
  end

  def convert_cart_session_to_hash

    cart = session[:cart] ? JSON.parse(session[:cart]) : {}
    cart.with_indifferent_access
  end

  def set_cart
    cart = convert_cart_session_to_hash

    set_session_and_response(cart)
  end

  def set_session_and_response(cart)
    items = cart.values

    @total_amount = items.inject(0) { |sum, item| sum + (item[:amount].to_f * item[:quantity]).round(2) }
    @size = cart.size
    @items = cart


    session[:cart] = JSON.generate(cart)

    respond_to do |format|
      format.js
    end
  end
end


require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  context "when creating a new order" do
    it "removes product from cart if product is present" do
      products = create_list(:product, 4)
      customer = create(:customer)
      session[:customer_id] = customer.id

      products_hash = {}
      products.each do |product|
        products_hash[product.id.to_s] = { amount: (product.price.to_f).round(2), quantity: 1,  name: product.name}
      end
      allow(controller).to receive(:convert_cart_session_to_hash).and_return(products_hash)

      expect {
        get :new
      }.to change(Order,:count).by(1)

      expect {
        get :new
      }.to change(OrderLine,:count).by(4)

      Product.destroy_all
      Order.destroy_all
    end
  end
end

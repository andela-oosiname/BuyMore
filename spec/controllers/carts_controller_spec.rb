require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  context "when adding items to cart" do
    it "adds product to cart" do
      product = create(:product)

      xhr :post, :add_item, {
        product_id: product.id, quantity: 2
      }

       expect(response).to render_template "add_item"
    end
  end

  context "when removing item from cart" do
    it "removes product from cart if product is present" do
      products = create_list(:product, 4)

      products_hash = {}
      products.each do |product|
        products_hash[product.id.to_s] = { amount: (product.price.to_f).round(2), quantity: 1,  name: product.name}
      end
      allow(controller).to receive(:convert_cart_session_to_hash).and_return(products_hash)

      xhr :get, :remove_item,  id: products.first.id
      expect(response).to render_template "remove_item"

      Product.destroy_all
    end
  end

  context "when getting cart contents" do
    it "retrieves cart and stores and calculates total amount" do
      products = create_list(:product, 2)

      products_hash = {}
      products.each do |product|
        products_hash[product.id.to_s] = { amount: (product.price.to_f).round(2), quantity: 1,  name: product.name}
      end
      allow(controller).to receive(:convert_cart_session_to_hash).and_return(products_hash)

      get :index
      expect(assigns(:total_amount)).not_to be_nil
    end
  end

end

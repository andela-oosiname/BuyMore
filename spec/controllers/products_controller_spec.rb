require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  it 'renders the right view when creating new product' do
    get :new
    expect(response).to render_template 'new'
  end

  it 'renders the right view when editing a product' do
    product = create(:product)
    get :edit, id: product.id
    expect(response).to render_template 'edit'
  end

  context 'when adding a product' do
    it 'adds product with valid attributes' do
      expect do
        post :create, product: attributes_for(:product)
      end.to change(Product, :count).by(1)
    end

    it 'raises the right error when parameters are not valid' do
      post :create, product: attributes_for(:product, name: nil)

      expect(flash['notice']).to include 'Ooops product not added'
    end
  end

  context 'when editing a product' do
    it 'edits product with valid attributes' do
      product = create(:product)

      new_name = Faker::Commerce.product_name
      put :update, id: product.id, product: { name: new_name }

      expect(flash['notice']).to eq 'Product Updated'
    end

    it 'raises the right error when parameters are not valid' do
      product = create(:product)

      new_name = nil
      put :update, id: product.id, product: { name: new_name }
      expect(Product.last.name).to eq product.name

      expect(flash['notice']).to eq 'Ooops An Error Occured'
    end
  end
end

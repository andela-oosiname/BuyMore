require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'renders the right view when creating new user' do
    get :new
    expect(response).to render_template 'new'
  end

  context 'when creating a new customer' do
    it 'creates customer with valid attributes' do
      post :create, customer: attributes_for(:customer)

      expect(flash['notice']).to include 'Welcome'
      expect(response).to redirect_to root_path
    end

    it 'raises the right error when parameters are not vaid' do
      post :create, customer: attributes_for(:customer, password: 'pp')

      expect(flash['notice']).to include 'Error Signing Up'
      expect(response).to redirect_to new_customer_path
    end
  end
end

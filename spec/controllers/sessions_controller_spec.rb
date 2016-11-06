require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'renders the right view when user attempts to sign in' do
    get :new
    expect(response).to render_template 'new'
  end

  context 'while authenticating with invalid details' do
    it 'raises the right error when email is not valid' do
      customer = create(:customer)
      post :create, email: 'invalid', password: customer.password
      expect(flash['notice']).to include 'Invalid email/password'
      expect(response).to redirect_to login_path
      customer.destroy
    end

    it 'raises the right error when password is not valid' do
      customer = create(:customer)
      post :create, email: customer.email, password: customer.password + 'bad password'
      expect(flash['notice']).to include 'Invalid email/password'
      expect(response).to redirect_to login_path
      customer.destroy
    end
  end

  context 'while authenticating with valid details' do
    it 'logs the customer in successfully' do
      customer = create(:customer)
      post :create, email: customer.email, password: customer.password
      expect(flash['notice']).to include "Welcome #{customer.firstname}"
      expect(response).to redirect_to root_path
      customer.destroy
    end
  end

  context 'while logging out' do
    it 'logs the customer out successfully' do
      customer = create(:customer)
      session[:customer_id] = customer.id

      get :destroy

      expect(flash['notice']).to include 'Logged Out Successfully'
      expect(response).to redirect_to root_path
      customer.destroy
    end
  end
end

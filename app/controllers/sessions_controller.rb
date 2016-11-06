class SessionsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.find_by_email(customer_params[:email])

    if customer && customer.password == customer_params[:password]
      login customer
      flash['notice'] = "Welcome #{customer.firstname}"
      redirect_to root_path
    else
      flash['notice'] = 'Invalid email/password'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:customer_id)
    flash['notice'] = 'Logged Out Successfully'

    redirect_to root_path
  end

  def customer_params
    params.permit(:email, :password)
  end
end

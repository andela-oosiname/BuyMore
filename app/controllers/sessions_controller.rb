class SessionsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.find_by_email(customer_params[:email])

    if customer && customer.password == customer_params[:password]
      login customer
      redirect_to root_path
    else
      flash["error"] = "Invalid email/password"
      redirect_to login_path
    end
  end

  def customer_params
    params.permit(:email, :password)
  end
end

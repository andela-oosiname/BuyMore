class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new(customer_params)

    if customer.save
      login customer

      flash["notice"] = "Welcome #{customer.firstname}"
      return redirect_to root_path
    else
      flash["notice"] = "Error Signing Up"
      redirect_to new_customer_path
    end
  end

  def customer_params
    params.require(:customer).permit(:email, :firstname, :lastname, :password)
  end
end

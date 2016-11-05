class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new(customer_params)

    if customer.save
      login customer
      return redirect_to root_path
    else
      flash["error"] = "Error Signing Up"
      redirect_to :back
    end
  end

  def customer_params
    params.require(:customer).permit(:email, :firstname, :lastname, :password)
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
   Customer.find_by(id: session[:customer_id])
  end

  def login(customer)
    session[:customer_id] = customer.id
  end

  def logout
    session.delete(:customer_id)
  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.first(12)
    @items = {}
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)

    if product.save
      flash["notice"] = "Product successfully added"

      return redirect_to new_product_path
    else
       flash["notice"] = "Ooops product not added"
       render :new
    end
  end

  def edit
     @product = Product.find_by(params[:id])
  end

  def update
      product = Product.find_by(params[:id])

    if product.update(product_params)
      flash["notice"] = "Product Updated"

      return redirect_to product_path(product)
    else
       flash["notice"] = "Ooops An Error Occured"
       render :edit
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    @items = {}
  end

  private

  def product_params
    params.require(:product).permit(:name, :image_url, :price, :description, :status)
  end
end

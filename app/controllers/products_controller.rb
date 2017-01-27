class ProductsController < ApplicationController
  def index
    sort_variable = params[:sort]
        if sort_variable
          @recipes = Product.all.order(sort_variable)
        else
          @recipes = Product.all
        end
    @products = Product.all
    render "index.html.erb"
  end
  def show
    @product = Product.find_by(id: params[:id])
  end
  def new

  end
  def create
    name = params[:name]
    description = params[:description]
    price = params[:price]
    image = params[:image]
    product = Product.new({name: name, description: description, price: price, image: image})
    product.save
    flash[:info] = "Product created"
    redirect_to "/products/#{product.id}"
  end
  def edit
    @product = Product.find_by(id: params[:id])
  end
  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes({})
    product.name = params[:name]
    product.description = params[:description]
    product.price = params[:price]
    product.image = params[:image]
    
    product.save
    flash[:success] = "Product updated"
    redirect_to "/products/#{product.id}" 
  end
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product deleted"
    redirect_to "/products"
  end
end


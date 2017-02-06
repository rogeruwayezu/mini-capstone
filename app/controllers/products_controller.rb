class ProductsController < ApplicationController
  def index
    if params[:price]
      @products = Product.all.order(price: params[:price]) 
    elsif params[:filter]
      @products = Product.where("price < ?", 200)
    
    elsif params[:category]
      @products =  Category.find_by(name: params[:category]).products
    else 
      @products = Product.all
    end
  end
  
  def show
    if params[:id] == "random"
    @product = Product.all.sample
    else
    @product = Product.find_by(id: params[:id])
    end
  end
  def new
    @suppliers = Supplier.all

  end
  def create
    name = params[:name]
    description = params[:description]
    price = params[:price]
    product = Product.new({name: name, description: description, price: price})
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
  def search
    search_query = params[:search_input]
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{search_query}%", "%#{search_query}%")
    
    if @product.empty?
      flash[:info] = "No product info"
    end
    render :index
  end
end


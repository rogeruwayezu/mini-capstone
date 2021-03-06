class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
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
    @product = Product.new
  end
  def create
   @product = Product.new({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id]
      })
    if @product.save
      flash[:success] = "Product created"
    redirect_to "/products/#{@product.id}"
    else
      @suppliers = Supplier.all
      flash[:warning] = "Product Not Created"
      render :new
    end
  end
  def edit
    @product = Product.find_by(id: params[:id])
    @suppliers = Supplier.all
  end
  def update
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id]
    })
    if @product.save
      flash[:success] = "Product Updated"  
      redirect_to "/products/#{@product.id}"
    else
      @suppliers = Supplier.all
      render :edit
    end
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


class ImagesController < ApplicationController
  def new
    render "new.html.erb"
  end
  def create
    name = params[:name]
    url = params[:url]
    product_id = params[:product_id]
    image = Image.new({name: name, url: url, product_id: product_id})
    product.save
    flash[:info] = "Image created"
    redirect_to "/images/#{image.id}"
  end
end

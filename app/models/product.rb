class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  def tax
    price * 0.09
  end
  def friendly_created_at
    created_at_strftime("%B %e, %Y")
  end
  def discount_items
    params[:discounts]
          @products = Product.where("price < ?", 200)
  end
end

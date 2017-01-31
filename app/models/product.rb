class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
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

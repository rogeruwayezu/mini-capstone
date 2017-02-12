class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :supplier, presence: true
  
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

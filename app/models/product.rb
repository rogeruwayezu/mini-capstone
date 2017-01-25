class Product < ApplicationRecord
  def tax
    price * 0.09
  end
  def friendly_created_at
    created_at_strftime("%B %e, %Y")
  end
  def price_list
    price.split(", ")
  end
end

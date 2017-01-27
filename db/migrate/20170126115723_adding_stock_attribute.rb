class AddingStockAttribute < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :indstock, :boolean
  end
end

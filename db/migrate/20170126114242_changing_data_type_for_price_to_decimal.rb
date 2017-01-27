class ChangingDataTypeForPriceToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :decimal, precision: 7, scale: 2

  end
end

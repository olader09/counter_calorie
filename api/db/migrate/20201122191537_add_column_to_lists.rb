class AddColumnToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :value_cal, :decimal, precision: 10, scale: 2, default: 0
    add_column :lists_products, :quantity, :decimal, precision: 10, scale: 2, default: 1
  end
end

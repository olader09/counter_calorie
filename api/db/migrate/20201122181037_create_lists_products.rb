class CreateListsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :lists_products do |t|
      t.belongs_to :list
      t.belongs_to :product
    end
  end
end

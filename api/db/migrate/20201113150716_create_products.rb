class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, default: ''
      t.decimal :proteins, precision: 10, scale: 2
      t.decimal :fats, precision: 10, scale: 2
      t.decimal :carbohydrates, precision: 10, scale: 2
      t.timestamps
    end
  end
end

class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end

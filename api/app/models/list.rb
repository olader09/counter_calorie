class List < ApplicationRecord
    belongs_to :user
    has_many :lists_products
    has_many :products, through: :lists_products

end

class ListsProduct < ApplicationRecord
    
    belongs_to :list
    belongs_to :product

end
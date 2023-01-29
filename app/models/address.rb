class Address < ApplicationRecord
    
    belongs_to :customer
    
    validates :address, presence: true
    validates :postal_code, presence: true, length: {maximum: 7, minimum: 7}
    
    
end

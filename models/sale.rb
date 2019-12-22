class Sale < ActiveRecord::Base

    belongs_to :product
    belongs_to :invoice
    has_many :clients, through: :invoices
    has_many :categories, through: :products
    
end
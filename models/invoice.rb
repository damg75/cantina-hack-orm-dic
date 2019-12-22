class Invoice < ActiveRecord::Base

    has_many :sales, dependent: :destroy
    belongs_to :client
    has_many :products, through: :sales
    
end
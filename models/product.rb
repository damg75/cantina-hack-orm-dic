class Product < ActiveRecord::Base

    belongs_to :category
    has_many :sales, dependent: :destroy

    validate :quantity_validate
    validate :price_validate

    def quantity_validate
        if product_quantity < 0
            errors[:base] << 'El producto debe tener cantidades iguales o mayores a cero'
        end
    end

    def price_validate
        if selling_price <= 0
            errors[:base] << 'El producto debe tener precio mayor a cero'
        end
    end

    before_destroy do
        puts
        puts 'Producto destruido de la base de datos'
        puts
        self.attributes.each do |key, value|
            print "#{key}: #{value} "
            puts
        end
        puts
    end

    before_save do
        puts
        puts 'Producto agregado a la base de datos'
        puts
        self.attributes.each do |key, value|
            print "#{key}: #{value} "
            puts
        end
        puts
    end

    before_update do
        puts
        puts 'Producto actualizado'
        puts
        self.attributes.each do |key, value|
            print "#{key}: #{value} "
            puts
        end
        puts
    end
    
end
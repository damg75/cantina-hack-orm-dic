class Client < ActiveRecord::Base

    has_many :invoices, dependent: :destroy
    has_one :sale, through: :invoice

    # validates :client_name, presence: true
    # validates :client_name, length: { minimum: 3, message: 'minimo  caracteres son 3' }

    validate :person_validate

    def person_validate
       if client_name == 'Marco' && client_last_name == 'Polo'
        errors[:base] << 'Esta persona esta baneada del sistema'
       end
    end

    before_destroy do
        puts
        puts 'Cliente destruido de la base de datos'
        puts
        self.attributes.each do |key, value|
            print "#{key}: #{value} "
            puts
        end
        puts
    end

    before_save do
        # self.client_name.capitalize!
        # self.client_last_name.capitalize!
        puts
        puts 'Cliente agregado a la base de datos'
        puts
        self.attributes.each do |key, value|
            print "#{key}: #{value} "
            puts
        end
        puts
    end

    
end
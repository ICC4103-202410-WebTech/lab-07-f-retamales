class User < ApplicationRecord
    has_many :posts #Un usuario puede tener muchas publicaciones

    #Validaciones
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, presence: true, lenght: {minimum: 6}

    #Callback
    before_save :downcase_email
    
    private
    def downcase_email:
        self.name = name.downcase #Para que el correo sea todo en minuscula
    end

end
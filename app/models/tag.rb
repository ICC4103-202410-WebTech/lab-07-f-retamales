class Tag < ApplicationRecord
    has_many :post_tags #Un tag puede tner muchos post_tags
    has_many :posts, through: :post_tags #un tag puede tener muchos posts

    #Validaciones
    validates :name, presence: {message: "El tag debe tener un nombre"}, uniqueness: true
end
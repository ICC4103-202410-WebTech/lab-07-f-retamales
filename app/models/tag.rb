class Tag < ApplicationRecord
    has_many :post_tags #Un tag puede tner muchos post_tags
    has_many :posts, throught: :post_tags #un tag puede tener muchos posts

    #Validaciones
    validates :name, presence: true, uniqueness: true
end
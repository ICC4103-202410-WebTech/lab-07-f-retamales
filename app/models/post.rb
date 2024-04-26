class Post < ApplicationRecord
    belongs_to :user #Un post pertenece a un usuario
    has_many :post_tags #Un post puede tener muchos pots_tags
    has_many :tags, through: :post_tags #Un post puede tener muchos tags, a través de post_tags

    #Validaciones
    validates :title, presence: {message: "El post debe tener un titulo"}
    validates :content, presence: {message: "El post debe tener contenido"}
    validates :user_id, presence: {message: "El post debe tener un user_id"}
    validates :answers_count, numericality: {greater_than_or_equal_to: 0, }
    validates :likes_count, numericality: {greater_than_or_equal_to: 0}

    #Callback
    before_validation :set_published_at_default, on: :create

    private
    def set_published_at_default
        self.published_at ||= Time.current #Si no se proporciona un valor, se le da el del valor actual
    end

end
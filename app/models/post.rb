class Post < ApplicationRecord
    belongs_to :user #Un post pertenece a un usuario
    has_many :post_tags #Un post puede tener muchos pots_tags
    has_many :tags, throught: :post_tags #Un post puede tener muchos tags, a traves de post_tags

    #Validaciones
    validates :title, presence: { message: "" }
    validates :content, presence: true
    validates :user_id, presence: true
    validates :answers_count, numerically: {greater_than_or_equal_to: 0, }
    validates :likes_count, numerically: {greater_than_or_equal_to: 0}

    #Callback
    before_validation :set_published_at_default, on: :create

    private
    def set_published_at_default:
        self.published_at ||= Time.current #Si no se proporciona un valor, se le da el del valor actual
    end

end
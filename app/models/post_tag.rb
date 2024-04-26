class PostTag < ApplicationRecord
    belongs_to :post #PostTags pertenece a un objeto de post
    belongs_to :tag #PostTags pertenece a un objeto de tag
end
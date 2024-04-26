class AddParentPostToPosts < ActiveRecord::Migration[7.1]
  def change
    add_references :posts, :parent_post, foreign_key: {to_table: :posts}
  end
end

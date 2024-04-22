class AddUserRefToPosts < ActiveRecord::Migration[7.1]
  def change
    add_references :posts, :user, null: false, foreign_key: true
  end
end

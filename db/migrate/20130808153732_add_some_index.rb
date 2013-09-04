class AddSomeIndex < ActiveRecord::Migration
  def change
    add_index :users, :id

    add_index :posts, :id
    add_index :posts, :category_id

    add_index :categories, :id
  end
end

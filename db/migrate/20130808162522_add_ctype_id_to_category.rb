class AddCtypeIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :ctype_id, :integer

    add_index :categories, :ctype_id
  end
end

class CreateCtypes < ActiveRecord::Migration
  def change
    create_table :ctypes do |t|
      t.string :title
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end

    add_index :ctypes, :id
  end
end

class CreateTopLinks < ActiveRecord::Migration
  def change
    create_table :top_links do |t|
      t.string :title
      t.text :href

      t.timestamps
    end

    add_index :top_links, :id
  end
end

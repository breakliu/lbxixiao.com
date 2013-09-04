class AddOnTopToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :on_top, :boolean, default: true
  end
end

class AddPageTplToCtype < ActiveRecord::Migration
  def change
    add_column :ctypes, :page_tpl, :string
  end
end

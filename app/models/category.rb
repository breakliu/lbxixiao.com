class Category < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  belongs_to :ctype
  has_many :posts

  def next(id)
    posts.where("id > ?", id).order(id: :desc).last
  end

  def prev(id)
    posts.where("id < ?", id).order(id: :desc).first
  end
end

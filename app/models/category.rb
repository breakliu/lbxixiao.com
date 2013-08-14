class Category < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes

  belongs_to :ctype
  has_many :posts

  scope :on_top, -> { where(on_top: true) }

  def next(id)
    posts.where("id > ?", id).order(id: :desc).last
  end

  def prev(id)
    posts.where("id < ?", id).order(id: :desc).first
  end
end

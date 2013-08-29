class Category < ActiveRecord::Base
  mount_uploader :image, CimageUploader

  acts_as_nested_set
  include TheSortableTree::Scopes

  belongs_to :ctype
  has_many :posts

  scope :on_top, -> { where(on_top: true) }

  def next(id)
    posts.where("id < ?", id).order(id: :desc).first
  end

  def prev(id)
    posts.where("id > ?", id).order(id: :desc).last
  end
end

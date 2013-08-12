class Post < ActiveRecord::Base
  belongs_to :category

  default_scope { order(id: :desc) }
end

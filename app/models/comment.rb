class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :commentable, polymorphic: true
end

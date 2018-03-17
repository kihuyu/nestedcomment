module Nestedcomments
  class Comment < ApplicationRecord
    validates :comment_body, presence: true
  end
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates_presence_of :user_id, :post_id, :body
end

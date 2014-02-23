class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :votes

  validates_presence_of :user_id, :title, :body

  def pretty_title
    self.title.split.map(&:capitalize).join(' ')
  end

end

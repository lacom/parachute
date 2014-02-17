class User < ActiveRecord::Base

  has_many :posts

  validates_presence_of :first_name, :last_name, :email

  def name
    [self.first_name, self.last_name].map(&:capitalize).join(' ')
  end

end

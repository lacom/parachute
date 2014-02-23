class User < ActiveRecord::Base

  has_many :posts

  validates_presence_of :first_name, :last_name, :email

  def abbr_name
    "#{self.first_name} #{self.last_name.byteslice(0,1)}."
  end

end

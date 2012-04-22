class User < ActiveRecord::Base
  has_many :posts
  attr_accessible :age, :first_name, :last_name
end

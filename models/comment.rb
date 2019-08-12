class Comment < ActiveRecord::Base
  belongs_to :user # adds new methods to comment objects for me eg .user
  belongs_to :dish # dish_id is foreign key
  validates :body, length: { in: 2..2000 }
end
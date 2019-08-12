# class maps to table
# objects maps to records
# following 2 lines is we teach activerecord to do that mapping
# naming conventions
# singular for model name
# plural for table name
class Dish < ActiveRecord::Base
  # tones of methods included for you
  validates :title, length: { minimum: 2 }
  # validates :image_url, length: { in: 10..100 }
  has_many :comments
  belongs_to :user
  belongs_to :category
end
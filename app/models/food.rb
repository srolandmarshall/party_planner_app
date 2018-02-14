class Food < ActiveRecord::Base
  has_many :users
  belongs_to :dish
  has_many :parties, through: :dishes
end

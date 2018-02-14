class Food < ActiveRecord::Base
  has_many :users
  has_many :dishes
  has_many :parties, through: :dishes
end

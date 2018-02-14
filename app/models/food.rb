class Food < ActiveRecord::Base
  has_many :users
  has_many :parties, through: :users
  has_many :dishes, through: :users
end

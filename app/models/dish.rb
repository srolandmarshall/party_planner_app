class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  has_many :foods
end

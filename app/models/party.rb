class Party < ActiveRecord::Base
  has_many :users
  has_many :foods
  has_many :drinks
end

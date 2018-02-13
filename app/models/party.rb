class Party < ActiveRecord::Base
  has_many :users
  has_many :foods
  has_many :drinks
  belongs_to :host, class_name: 'User', foreign_key: "user_id"
end

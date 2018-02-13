class Party < ActiveRecord::Base
  has_many :users
  has_many :foods
  has_many :drinks
  has_one :host, class_name: 'User', foreign_key: 'host_id'
end

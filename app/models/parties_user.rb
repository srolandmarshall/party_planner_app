class PartiesUser < ActiveRecord::Base
  belongs_to :party
  belongs_to :user
  has_and_belongs_to_many :attended_events, class_name: 'Event'

end

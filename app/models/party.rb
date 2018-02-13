class Party < ActiveRecord::Base
  has_many :users
  has_many :foods
  has_many :drinks
  belongs_to :host, class_name: 'User'
  has_and_belongs_to_many :attendees, class_name: 'User'


  def display_time
    self.time.strftime("%A, %D, %H:%M%P")
  end

  def self.nonexpired_parties
    self.where('time > ?', DateTime.now.beginning_of_day).order('time ASC')
  end

  def self.old_parties
    self.where('time < ?', DateTime.now.beginning_of_day).order('time DESC')
  end

  def attend(user)
    self.attendees << user
    self.update
  end

end

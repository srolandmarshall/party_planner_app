class Party < ActiveRecord::Base
  has_many :users
  has_many :foods
  has_many :drinks
  belongs_to :host, class_name: 'User'

  def display_time
    self.time.strftime("%A, %D, %H:%M%P")
  end

end

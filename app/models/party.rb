class Party < ActiveRecord::Base
  has_many :users
  has_many :drinks
  belongs_to :host, class_name: 'User'
  has_and_belongs_to_many :attendees, class_name: 'User'
  has_many :dishes
  has_many :foods, through: :dishes

  validates :name, presence: true
  validates :address, presence: true
  validates :time, :timeliness => {:on_or_after => lambda { Date.current }, :type => :date}


  def display_time
    self.time.strftime("%A, %D, %H:%M%P")
  end

  def self.nonexpired_parties
    self.where('time >= ?', DateTime.now).order('time ASC')
  end

  def self.old_parties
    self.where('time < ?', DateTime.now).order('time DESC')
  end

  def attend(user)
    self.attendees << user
    self.update
  end

  def add_food(food)
    self.foods << food
    self.update
  end

  def add_drink(drink)
    self.drinks << drink
    self.update
  end

end

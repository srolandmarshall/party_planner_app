class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  belongs_to :food

  # checks that user does not bring same food to party more than once
  # validates :dish_user_food, uniqueness: {scope: [:party_id, :food_id]}


  def food_category
    self.food.category
  end

  def self.desserts
    joins(:food).where(foods: {category: "dessert"})
  end

  def self.entrees
    joins(:food).where(foods: {category: "entree"})
  end

  def self.apps
    joins(:food).where(foods: {category: "appetizer"})
  end

  def self.most_popular
    group(:food_id).order('count_id DESC').limit(5).count(:id)
  end

  def user_name
    self.user.name
  end

  def name
    self.food.name
  end

end

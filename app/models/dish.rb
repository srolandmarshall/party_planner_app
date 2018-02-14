class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  belongs_to :food

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

end

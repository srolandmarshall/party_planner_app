module ApplicationHelper
  def display_dish(dish)
    dish.food.name+" - "+dish.user.name
  end
end

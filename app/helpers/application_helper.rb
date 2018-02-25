module ApplicationHelper
  def display_dish(dish)
    dish.name+" - "+dish.user_name
  end
end

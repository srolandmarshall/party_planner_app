class AddDishIdToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :dish_id, :integer
  end
end

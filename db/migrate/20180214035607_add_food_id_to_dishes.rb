class AddFoodIdToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :food_id, :integer
  end
end

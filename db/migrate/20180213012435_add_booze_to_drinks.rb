class AddBoozeToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :booze, :boolean
  end
end

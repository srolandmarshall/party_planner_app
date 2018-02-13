class AddTimeToParties < ActiveRecord::Migration
  def change
    add_column :parties, :time, :DateTime
  end
end

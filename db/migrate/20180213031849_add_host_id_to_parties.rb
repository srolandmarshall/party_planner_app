class AddHostIdToParties < ActiveRecord::Migration
  def change
    add_column :parties, :host_id, :integer
  end
end

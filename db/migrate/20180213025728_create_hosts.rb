class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.integer :user_id
      t.integer :party_id

      t.timestamps null: false
    end
  end
end

class CreatePartiesUsers < ActiveRecord::Migration
  def change
    create_table :parties_users do |t|

      t.timestamps null: false
    end
  end
end

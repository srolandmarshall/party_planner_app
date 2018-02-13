class CreateJoinTableUsersParties < ActiveRecord::Migration
  def change
    create_join_table :users, :parties do |t|
      t.index :user_id
      t.index :party_id
    end
  end
end

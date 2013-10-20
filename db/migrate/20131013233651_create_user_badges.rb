class CreateUserBadges < ActiveRecord::Migration
  def change
    create_join_table :users, :badges do |t|
      t.index :user_id
      t.index :badge_id
    end
  end
end

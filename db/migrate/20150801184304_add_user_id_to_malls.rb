class AddUserIdToMalls < ActiveRecord::Migration
  def change
    add_column :malls, :user_id, :integer
  end
end

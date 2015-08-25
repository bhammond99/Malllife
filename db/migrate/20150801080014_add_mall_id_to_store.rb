class AddMallIdToStore < ActiveRecord::Migration
  def change
    add_column :stores, :mall_id, :integer
  end
end

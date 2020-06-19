class RemoveNameToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name
    remove_column :blogs, :use_id
  end
end

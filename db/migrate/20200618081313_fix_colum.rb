class FixColum < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :blogs, :user_id, :bigint

  end
end

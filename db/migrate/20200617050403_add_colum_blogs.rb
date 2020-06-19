class AddColumBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :use_id, :bigint
  end
end

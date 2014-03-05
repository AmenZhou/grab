class AddImageThumbToPost < ActiveRecord::Migration
  def change
    add_column :posts, :image_thumb, :string
  end
end

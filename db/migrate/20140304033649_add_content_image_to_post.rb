class AddContentImageToPost < ActiveRecord::Migration
  def change
    add_column :posts, :content_image, :string
  end
end

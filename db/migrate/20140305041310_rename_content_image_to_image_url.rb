class RenameContentImageToImageUrl < ActiveRecord::Migration
  def change
		rename_column :posts, :content_image, :image_url
  end
end

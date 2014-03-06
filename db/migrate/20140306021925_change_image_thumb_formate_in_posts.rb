class ChangeImageThumbFormateInPosts < ActiveRecord::Migration
  def up
		change_column :posts, :image_thumb, :text
  end
	def down
		change_column :posts, :image_thumb, :string
  end
end

class ChangeColumeType < ActiveRecord::Migration
  def up
		change_column :posts, :image_url, :text
  end
	def down
		change_column :posts, :image_url, :string
  end
end

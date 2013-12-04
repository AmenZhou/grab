class AddUpTimeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :up_time, :datetime
  end
end

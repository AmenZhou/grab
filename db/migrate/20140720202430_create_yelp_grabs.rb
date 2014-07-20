class CreateYelpGrabs < ActiveRecord::Migration
  def change
    create_table :yelp_grabs do |t|
      t.string :name
      t.string :address
      t.string :phone_num
      t.string :yelp_id
      t.string :url

      t.timestamps
    end
  end
end

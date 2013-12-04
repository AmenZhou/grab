class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :ct_name
      t.string :unique_code
      t.string :detail_url
      t.datetime :upload_time
      t.text :content
      t.string :phone_n
      t.string :rent_m
      t.string :site_source

      t.timestamps
    end
  end
end

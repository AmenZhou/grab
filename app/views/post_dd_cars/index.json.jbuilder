json.array!(@post_dd_cars) do |post_dd_car|
  json.extract! post_dd_car, :id, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time
  json.url post_dd_car_url(post_dd_car, format: :json)
end

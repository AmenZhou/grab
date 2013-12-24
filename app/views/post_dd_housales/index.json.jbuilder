json.array!(@post_dd_housales) do |post_dd_housale|
  json.extract! post_dd_housale, :id, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time
  json.url post_dd_housale_url(post_dd_housale, format: :json)
end

json.array!(@post_ulo_housrents) do |post_ulo_housrent|
  json.extract! post_ulo_housrent, :id, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time
  json.url post_ulo_housrent_url(post_ulo_housrent, format: :json)
end
json.array!(@post_ulos) do |post_ulo|
  json.extract! post_ulo, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time
  json.url post_ulo_url(post_ulo, format: :json)
end

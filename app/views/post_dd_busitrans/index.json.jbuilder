json.array!(@post_dd_busitrans) do |post_dd_busitran|
  json.extract! post_dd_busitran, :id, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time
  json.url post_dd_busitran_url(post_dd_busitran, format: :json)
end

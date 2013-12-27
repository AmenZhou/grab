json.array!(@post_ulo_busitrans) do |post_ulo_busitran|
  json.extract! post_ulo_busitran, :id, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time
  json.url post_ulo_busitran_url(post_ulo_busitran, format: :json)
end

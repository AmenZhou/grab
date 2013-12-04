json.array!(@posts) do |post|
  json.extract! post, :id, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source
  json.url post_url(post, format: :json)
end

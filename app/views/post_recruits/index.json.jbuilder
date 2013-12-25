json.array!(@post_recruits) do |post_recruit|
  json.extract! post_recruit, :id, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time
  json.url post_recruit_url(post_recruit, format: :json)
end

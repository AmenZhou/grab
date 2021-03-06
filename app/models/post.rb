class Post < ActiveRecord::Base
  require "open-uri"
  scope :old_data, -> { where("created_at < ?", (Time.now - 7.day)) }

  def self.grab_dadi(grab_lines = 10, grab_source = 'dadi_housrent_flushing')
    page_array = [0]#[0,25,50,75,100]

    if grab_source == 'dadi_housrent_flushing'
      region_array = [{:id => 26, :name => 'Flushing'}]
    elsif grab_source == 'dadi_housrent_manhattan'
      region_array = [{:id => 47, :name => 'Manhattan'}]
    elsif grab_source == 'dadi_housrent_queens'
      region_array = [{:id => 53, :name => 'Queens'}]
    elsif grab_source == 'dadi_housrent_brooklyn'
      region_array = [{:id => 46, :name => 'Brooklyn'}]
    elsif grab_source == 'dadi_housrent_elmhurst'	
      region_array = [{:id => 48, :name => 'Elmhurst'}]		
    elsif grab_source == 'dadi_housale'
      region_array = [{:id => 36, :name => ''}]		
    elsif grab_source == 'dadi_busitran'
      region_array = [{:id => 27, :name => ''}]		
    elsif grab_source == 'dadi_recruit'
      region_array = [{:id => 29, :name => 'Recruit employees'}]
    elsif grab_source == 'dadi_restaurant_recruit'
      region_array = [{:id => 57, :name => 'Restaurant'}]
    elsif grab_source == 'dadi_nails_recruit'
      region_array = [{:id => 56, :name => 'Nails and Barbor'}]
    elsif grab_source == 'dadi_massage_recruit'
      region_array = [{:id => 52, :name => 'Massage'}]
    elsif grab_source == 'dadi_car'
      region_array = [{:id => 82, :name => ''}]
    else
      region_array = [{:id => 82, :name => ''}]
    end

    count = 0
    number = 0
    arr_list = Array.new
    code_list = Post.where(:site_source => grab_source).map(&:unique_code)

    page_array.each do |page|
      begin
        region_array.each do |region|
          doc = Nokogiri::HTML(open("http://c.dadi360.com/c/forums/show/" + page.to_s + "/" + region[:id].to_s + ".page"))
          doc.css('tr[class="bg_small_yellow"]').each do |order|
            unit = Hash.new
            unit[:detail_url] = order.css('span[class="topictitle"]').css('a').attr('href').value[/^.*page/]
            unit[:ct_name] = region[:name]
            unit[:unique_code] = unit[:detail_url][/\d+/]
            unit[:title] = order.css('span[class="topictitle"]').text.strip
            unit[:up_time] = order.css('td[class*="row3"]').text.strip
            arr_list << unit 
            number += 1 unless code_list.include? unit[:unique_code]
            break if number >= grab_lines
          end 
        end
      rescue Exception => e
        Rails.logger.error e.backtrace.join("\n")
        next
      end
    end

    arr_list.each do |unit|
      begin
        unless code_list.include? unit[:unique_code]
          post = Post.new
          detail_url = 'http://c.dadi360.com' + unit[:detail_url]
          doc = Nokogiri::HTML(open(detail_url))
          content = doc.css('div[class="postbody"]').text.strip
          post.title = unit[:title]
          post.ct_name = unit[:ct_name]
          post.up_time = parse_up_time(unit[:up_time]) unless unit[:up_time].nil?
          post.unique_code = unit[:unique_code]
          post.detail_url = detail_url
          post.upload_time = Date.today
          post.content = content
          post.phone_n = content[/\d{3}.?\d{3}.?\d{4}/]
          post.rent_m = content[/\$\d+/]
          post.site_source = grab_source

          post.image_url = ''
          post.image_thumb = ''
          attach_block = doc.css('td[class="attachrow"]')
          attach_block.each do |code|
            image_download_url_t = code.css('a').attr('href').value[/^.*page/]
            image_thumb_url_t = code.css('img').attr('src').value[/^.*thumb/]
            image_download_url = 'http://c.dadi360.com/' + image_download_url_t
            image_thumb_url = 'http://c.dadi360.com/' + image_thumb_url_t

            post.image_url += image_download_url
            post.image_thumb += image_thumb_url
          end
          post.save   
          count += 1
        end
      rescue Exception => e
        Rails.logger.error e.backtrace.join("\n")
        next
      end
    end
    old_data.destroy_all
    count
  end

  def self.parse_up_time time
    DateTime.strptime(time, '%Y/%m/%d')
  rescue
    time
  end
end


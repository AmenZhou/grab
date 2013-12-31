class PostDdHousale < ActiveRecord::Base

  def PostDdHousale::grab_dd_housale(limit = 10)
    page_array = [0]#[0,25,50,75,100]
    region_array = [{:id => 36, :name => 'NY'}]
    require "open-uri"
    count = 0
    number = 10
    arr_list = Array.new
    code_list = Post.where(:site_source => 'dadi').map(&:unique_code)
    page_array.each do |page|
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
          break if number >= limit
        end 
      end
    end
    
    arr_list.each do |unit|
      unless code_list.include? unit[:unique_code]
        post = PostDdHousale.new
        detail_url = 'http://c.dadi360.com/' + unit[:detail_url]
        begin
          doc = Nokogiri::HTML(open(detail_url))
        rescue OpenURI::HTTPError
          begin
            doc = Nokogiri::HTML(open(detail_url))
          rescue OpenURI::HTTPError
            doc = Nokogiri::HTML(open(detail_url))
          end
        end
        content = doc.css('div[class="postbody"]').text.strip
        post.title = unit[:title]
        post.ct_name = unit[:ct_name]
        post.up_time = DateTime.strptime(unit[:up_time], '%Y/%m/%d') unless unit[:up_time].nil?
        post.unique_code = unit[:unique_code]
        post.detail_url = detail_url
        post.upload_time = Date.today
        post.content = content
        post.phone_n = content[/\d{3}.?\d{3}.?\d{4}/]
        post.rent_m = content[/\$\d+/]
        post.site_source = "dadi"
        post.save   
        count += 1
      end
    end
    count
  end
end

require 'open-uri'

class PostUloHousrent < ActiveRecord::Base
	def PostUloHousrent::grab_ulo_housrent
		page_array = [1]
		region_array = [{:id => 1, :name => ''}]
		fid_num = 247
		arr_list = Array.new
		#grab page data , put into arr_list
		page_array.each do |page|
			region_array.each do |region|
				doc = Nokogiri::HTML(open("http://www.usalifeonline.com/f/list.php?fid=" + fid_num.to_s + "&" + "city_id=" + region[:id].to_s + "&" + "page=" + page.to_s))
				doc.css('table[class="listtable"]').each do |order|
					unit = Hash.new
					unit[:detail_url] = order.css('a').attr('href').value
					unit[:unique_code] = unit[:detail_url][/\d{6}/]
					unit[:title] = order.css('a').attr('title').value
					arr_list << unit					
				end
			end
		end
		#take unique code from database
		code_list = PostUloHousrent.where(:site_source => 'ulo').map(&:unique_code)
		arr_list.each do |unit|
			#compare unique codes, if one line has been grabbed, avoid grabbing its detail page again
			unless code_list.include? unit[:unique_code]
				post = PostUloHousrent.new
				detail_url = unit[:detail_url]
				begin
					doc = Nokogiri::HTML(open(detail_url))
				rescue OpenURI::HTTPError
					begin
						doc = Nokogiri::HTML(open(detail_url))
					rescue OpenURI::HTTPError
						doc = Nokogiri::HTML(open(detail_url))
					end
				end
				
				#grab all content area code
				grab_content_phone = doc.css('td[class="showinfo"]').css('td[width="89%"]')
				content = grab_content_phone[1].text.strip
				phone_n = grab_content_phone[2].text.strip
				#grab all date area code
				grab_date = doc.css('td[class="showinfo"]').css('td[width="50%"]')
				#select date from the date area code
				up_time = grab_date[0].text[/\d{4}.?\d{2}.?\d{2}/].strip
				#give value to database
				post.content = content
				post.title = unit[:title]
				post.up_time = DateTime.strptime(up_time, '%Y-%m-%d') unless up_time.nil?
				post.unique_code = unit[:unique_code]
				post.detail_url = detail_url
				post.upload_time = Date.today
				post.phone_n = phone_n
				post.rent_m = content[/\$\d+/]
				post.site_source = "ulo"
				post.save
			end
		end
	end
end
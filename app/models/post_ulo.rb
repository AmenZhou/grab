require 'open-uri'

class PostUlo < ActiveRecord::Base
	def PostUlo::grab_ulo(grab_lines = 10, grab_source = 'ulo_housrent')
		page_array = [1]
		region_array = [{:id => 1, :name => ''}]
		if grab_source == 'ulo_housrent'
			fid_array = [{:id => 247, :name => 'Single Room'},
				{:id => 246, :name => 'Whole House'},
				{:id => 461, :name => 'Short Time'},
				{:id => 394, :name => 'Else'},
				{:id => 460, :name => 'Wanna Rent'}]
		elsif grab_source == 'ulo_housale'
			fid_array = [{:id => 236, :name => 'Real estate'},
				{:id => 237, :name => 'Whole House Sale'},
				{:id => 239, :name => 'Department'},
				{:id => 241, :name => 'Condo'},
				{:id => 238, :name => 'Business'},
				{:id => 243, :name => 'Office'},
				{:id => 242, :name => 'Public'},
				{:id => 392, :name => 'Else'}]
		elsif grab_source == 'ulo_busitran'
			fid_array = [{:id => 288, :name => 'Restaurant Business'},
				{:id => 289, :name => 'Nails Business'},
				{:id => 292, :name => 'Massage Business'},
				{:id => 290, :name => 'Laudary'},
				{:id => 344, :name => 'Else'}]
		elsif grab_source == 'ulo_recruit'
			fid_array = [{:id => 253, :name => 'Restaurant Recruit'},
					{:id => 256, :name => 'Nails Recruit'},
					{:id => 254, :name => 'Massage Recruit'},
					{:id => 263, :name => 'Else'},
					{:id => 365, :name => 'Secretary'},
					{:id => 443, :name => 'Barber'},
					{:id => 260, :name => 'Driver'},
					{:id => 364, :name => 'Clinic'}]
		else
			fid_array = [{:id => 247, :name => 'Single Room'},
				{:id => 246, :name => 'Whole House'},
				{:id => 461, :name => 'Short Time'},
				{:id => 394, :name => 'Else'},
				{:id => 460, :name => 'Wanna Rent'}]
			grab_source = 'ulo_housrent'
		end
		
		number = 0
		arr_list = Array.new
		code_list = PostUlo.where(:site_source => grab_source).map(&:unique_code)
		#grab page data , put into arr_list
		page_array.each do |page|
			region_array.each do |region|
				fid_array.each do |fid|
					doc = Nokogiri::HTML(open("http://www.usalifeonline.com/f/list.php?fid=" + fid[:id].to_s + "&" + "city_id=" + region[:id].to_s + "&" + "page=" + page.to_s))
					doc.css('table[class="listtable"]').each do |order|
						unit = Hash.new
						unit[:detail_url] = order.css('a').attr('href').value
						unit[:unique_code] = unit[:detail_url][/\d{6}/]
						unit[:title] = order.css('a').attr('title').value
						unit[:ct_name] = fid[:name]
						arr_list << unit
						number += 1 unless code_list.include? unit[:unique_code]
						break if number >= grab_lines	
					end
				end
			end
		end
		#take unique code from database
		arr_list.each do |unit|											
			#compare unique codes, if one line has been grabbed, avoid grabbing its detail page again
			unless code_list.include? unit[:unique_code]
				post = PostUlo.new
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
				#error condition solve
				if grab_content_phone.empty?
					break
				end
				content = grab_content_phone[1].text.strip
				phone_n = grab_content_phone[2].text.strip
				#grab all date area code
				grab_date = doc.css('td[class="showinfo"]').css('td[width="50%"]')
				#error condition solve
				if grab_date.empty?
					break
				end
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
				post.site_source = grab_source
				post.ct_name = unit[:ct_name]
				post.save
			end
		end
	end
end

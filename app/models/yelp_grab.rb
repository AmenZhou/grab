require_relative '../../lib/yelp'
class YelpGrab < ActiveRecord::Base
  def YelpGrab::grab
    begin_time = Time.now
    (1..900).each do |i|
      rs = Yelp.client.search('NYC', {term: 'Nail salons', limit: 20, offset: i})

      rs.businesses.each do |business|
        yp = YelpGrab.find_or_create_by_yelp_id(business.id)
        yp.update_attributes(
          name: business.try(:name),
          phone_num: business.try(:display_phone),
          url: business.try(:url),
          address: business.try(:location).try(:display_address).try(:join, ' ')
        )
      end
    end
    end_time = Time.now
    puts "Time cost: #{(end_time - begin_time).floor}"
  end

  def YelpGrab::export
    File.open('public/nyc.csv', 'w') do |file|
      YelpGrab.all.each do |yp|
        file.puts "#{yp.name}, #{yp.phone_num}, #{yp.url}, #{yp.address}"
      end
    end
  end

end

class Scrapper

  def self.eatnow

    # EatNow
    # https://www.eatnow.com.au/melbourne/southbank/takeaway.html

    agent = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Firefox'
    }

    location = "1 Freshwater Place, Southbank, Victoria, Australia"
    location_suburb_postcode = "Southbank - 3006"
    location_suburb = 'southbank'

    page_eatnow = agent.get('https://www.eatnow.com.au/')
    search_form_eatnow = page_eatnow.form(:action => '/search.html')
    search_form_eatnow.field_with(:name => 'postcode').value = location_suburb_postcode

    results_eatnow = agent.submit search_form_eatnow
    search_results_eatnow = Nokogiri::HTML(results_eatnow.body)

    listing_eatnow = search_results_eatnow.xpath('//div[contains(@class, "restResultContainer")]')

    listing_eatnow.each do |item|

      title = item.css('h2').text.strip
      image = item.css('.rest-result-logo').css('img').attr('src')

      address_street = item.css('.rest-result-address').css('span')[0].text.strip
      address_suburb = item.css('.rest-result-address').css('span')[1].text.strip
      address = address_street + ' ' + address_suburb

      tag_holder = []
      tags = item.css('.rest-result-cuisine').css('span')

      tags.each do |tag|
        tag_holder.push(tag.text.strip)
      end

      availability_input = item.css('.mainButton')[1].text.strip

      if availability_input == 'unavailable today'
        availability = 'Currently Closed'
      elsif availability_input == 'order now'
        availability = 'Open'
      elsif availability_input == 'pre-order'
        availability = 'Closed'
      end

      delivery_provider = 'EatNow'

      # puts 'title: ' + title
      # puts 'image: ' + image
      # puts 'address: ' + address
      # pp tag_holder
      # puts 'availability: ' + availability
      # puts 'delivery_provider: ' + delivery_provider
      # puts '##########'



      db_title_check = Food.find_by(name: title)

      if !db_title_check

        @food = Food.new
        @food.name = title
        @food.image_url = image
        @food.address_street = address_street
        @food.address_suburb = address_suburb
        @food.provider = delivery_provider
        @food.save

        tag_holder.each do |tagEntry|

          @tag = Tag.new
          @tag.tag = tagEntry
          @tag.save

          @food_tags = FoodTag.new
          @food_tags.food_id = @food.id
          @food_tags.tag_id = @tag.id
          @food_tags.save

        end

      end

    end

  end

end

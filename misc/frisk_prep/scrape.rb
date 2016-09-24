

require 'mechanize'
require 'pry'

agent = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Firefox'
}

location = "1 Freshwater Place, Southbank, Victoria, Australia"
location_suburb_postcode = "Southbank - 3006"
location_suburb = 'southbank'

# /////////////////////////////////////////////////////////////////////////////

# # DeliveryHero
# # https://www.deliveryhero.com.au/takeaway-melbourne/southbank/
#

web_address = 'https://www.deliveryhero.com.au/takeaway-melbourne/' + location_suburb + '/'
page_deliveryhero = agent.get( web_address )

# hey = search_results_deliveryhero.at_css('.fetch-more').click
hey = page_deliveryhero.at('.fetch-more')
pp hey

# search_results_deliveryhero = Nokogiri::HTML(page_deliveryhero.body)


# listing_deliveryhero = search_results_deliveryhero.xpath('//div[contains(@class, "restResultContainer")]')










# /////////////////////////////////////////////////////////////////////////////

# # EatNow
# # https://www.eatnow.com.au/melbourne/southbank/takeaway.html
#
# page_eatnow = agent.get('https://www.eatnow.com.au/')
# search_form_eatnow = page_eatnow.form(:action => '/search.html')
# search_form_eatnow.field_with(:name => 'postcode').value = location_suburb_postcode
#
# results_eatnow = agent.submit search_form_eatnow
# search_results_eatnow = Nokogiri::HTML(results_eatnow.body)
#
# listing_eatnow = search_results_eatnow.xpath('//div[contains(@class, "restResultContainer")]')
#
# listing_eatnow.each do |item|
#
#   title = item.css('h2').text.strip
#   image = item.css('.rest-result-logo').css('img').attr('src')
#
#   address_street = item.css('.rest-result-address').css('span')[0].text.strip
#   address_suburb = item.css('.rest-result-address').css('span')[1].text.strip
#   address = address_street + ' ' + address_suburb
#
#   tag_holder = []
#   tags = item.css('.rest-result-cuisine').css('span')
#
#   tags.each do |tag|
#     tag_holder.push(tag.text.strip)
#   end
#
#   availability_input = item.css('.mainButton')[1].text.strip
#
#   if availability_input == 'unavailable today'
#     availability = 'Currently Closed'
#   elsif availability_input == 'order now'
#     availability = 'Open'
#   elsif availability_input == 'pre-order'
#     availability = 'Closed'
#   end
#
#   delivery_provider = 'EatNow'
#
#   puts 'title: ' + title
#   puts 'image: ' + image
#   puts 'address: ' + address
#   pp tag_holder
#   puts 'availability: ' + availability
#   puts 'delivery_provider: ' + delivery_provider
#   puts '##########'
#
# end



# /////////////////////////////////////////////////////////////////////////////

# # MenuLog
# # https://www.menulog.com.au/takeaway/southbank
#
# page_menulog = agent.get('https://www.menulog.com.au/')
#
# search_form_menulog = page_menulog.form(:action => '/takeaway/search.php')
# search_form_menulog.field_with(:name => 'locationTerm').value = location_suburb_postcode
# results_menulog = agent.submit search_form_menulog
#
# search_results_menulog = Nokogiri::HTML(results_menulog.body)
# listing_container_menulog = search_results_menulog.css('#searchResultBlock')
# listing_menulog = listing_container_menulog.css('.content')
#
# begin
#
#   listing_menulog.each do |item|
#
#     title = item.css('h2').css('.restaurantName').text.strip
#     image = item.css('.colLogo').css('img').attr('src').to_s[2..-1]
#     tag = item.css('.cuisineNameList').text.strip
#
#     availability_input = item.css('.btnSearchOrderVenue').css('a').text.strip
#
#     if availability_input == 'Pre-Order'
#       availability = 'Currently Closed'
#     elsif availability_input == 'See Menu'
#       availability = 'Open'
#     end
#
#     delivery_provider = 'MenuLog'
#
#     puts 'title: ' + title
#     puts 'image: ' + image
#     puts 'tag: ' + tag
#     puts 'availability: ' + availability
#     puts 'delivery_provider: ' + delivery_provider
#     puts '##########'

#
#   end
#
#   next_page_link = results_menulog.link_with(:text => 'NEXT ')
#
#   if next_page_link
#     next_page = true
#     results_menulog = next_page_link.click
#     listing_container_menulog = results_menulog.css('#searchResultBlock')
#     listing_menulog = listing_container_menulog.css('.content')
#   else
#     next_page = false
#   end
#
# end until next_page == false


























# puts search_results_eatnow.css('.rest-result-title')
# puts search_results_eatnow.xpath('//div[@class="restResultContainer"]')

# search_results_eatnow.xpath('//div[contains(@class, "restResultContainer")]').each do |listing|
#   # title = listing.xpath('//div[contains(@class, "rest-result-title")]//h2').text
#   puts listing
# end


#
#
# # UBER
#
# page_uber = agent.get('https://ubereats.com/')
# search_form_uber = page_uber.form(:action => 'https://eats.uber.com')
# search_form_uber.field_with(:name => "location").value = location
#
# results_uber = agent.submit search_form_uber
# # search_results_uber = Nokogiri::HTML(results_uber.body)
# json = Mechanize.new.get('http://www.bitlc.net/stats.json').body
# result = JSON.parse json
#
#
# Request URL:https://eats.uber.com/rtapi/eats/v1/marketplaces

# pp results_uber.body

# # Search Page for Element
# puts search_results_uber.at_css('#title_GCQcm')
# puts search_results_uber.at_xpath("//div[@class='item_36eJsF']")







# # Deliveroo
# page_deliveroo = agent.get('https://deliveroo.com.au/')
# search_form_deliveroo = page_deliveroo.form(:class => 'landing-index-page-search--form landing-index-page-search--non-postcode')
# search_form_deliveroo.field_with(:class => 'address-search').value = location
#
# results_deliveroo = agent.submit search_form_deliveroo
# search_results_deliveroo = Nokogiri::HTML(results_deliveroo.body)
# pp search_results_deliveroo

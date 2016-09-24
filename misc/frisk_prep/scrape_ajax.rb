require 'nokogiri'
require 'open-uri'
require 'watir'
require 'watir-webdriver'

browser = Watir::Browser.new
browser.goto "google.com"
sleep 2

pp browser

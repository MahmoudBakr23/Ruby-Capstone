require 'nokogiri'
require 'open-uri'

def web_scraper
  url = "https://www.goodreads.com/quotes"
  document = ::OpenURI.open_uri(url)
  parsed_document = Nokogiri::HTML(document)
end

web_scraper
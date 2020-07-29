require 'nokogiri'
require 'open-uri'

def web_scraper
  url = 'https://www.16personalities.com/personality-types'
  doc = ::OpenURI.open_uri(url)
  document = Nokogiri::HTML(doc)
  characters = []
  characters_types = document.css('a.type')

  characters_types.each do |c|
    character = {
      name: c.css('h4').text,
      type: c.css('h5').text,
      describtion: c.css('div.snippet').text
    }
    characters.push(character)
  end
end
web_scraper

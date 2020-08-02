#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

class Scrap
  attr_accessor :url, :doc, :document

  def initialize(url, _doc, _document)
    @url = url
    @doc = ::OpenURI.open_uri(url)
    @document = Nokogiri::HTML(@doc)
  end

  def web_scraper
    characters_types = @document.css('a.type')
    i = 1
    characters_types.each do |c|
      character = {
        rate: "Character #_#{i}",
        name: c.css('h4').text.strip,
        type: c.css('h5').text.strip,
        describtion: c.css('div.snippet').text.strip
      }
      character.each {|key, value| puts "(#{key.capitalize}) : #{value}"}
      i+=1
    end
  end

  def web_scraper_articles
    articles_scrapping = @document.css('article')
    i = 1
    articles_scrapping.each do |a|
      article = {
        rate: "Article #_#{i}",
        title: a.css('div.type a.with-border').text.strip,
        headline: a.css('a.title').text.strip,
        date: a.css('span.date').text.strip,
        author: a.css('span.author').text.strip,
        number_of_comments: a.css('span.comments a.with-border').text.strip
      }
      article.each {|key, value| puts "(#{key.capitalize}) : #{value}"}
      i+=1
    end
  end
end

scrapping = Scrap.new('https://www.16personalities.com/personality-types', @doc, @document)
scrapping.web_scraper

scrapping_articles = Scrap.new('https://www.16personalities.com/articles?category=all', @doc, @document)
scrapping_articles.web_scraper_articles

require 'spec_helper'
require_relative '../bin/app'

describe Scrap do

  describe '#web_scraper' do
    let(:scrap) {Scrap.new('https://www.16personalities.com/personality-types', @doc, @document)}
    it 'when scrapping characters' do
      expect(scrap.web_scraper).to equal(16)
    end
  end

  describe '#web_scraper_articles' do
    let(:scrap_2) {Scrap.new('https://www.16personalities.com/articles?category=all', @doc, @document)}
    it 'when scrapping articles' do
      expect(scrap_2.web_scraper_articles).to equal(8)
    end
  end
end

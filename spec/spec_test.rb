require_relative '../bin/app.rb'

describe Scrap do
  let(:scrap) {Scrap.new('https://www.16personalities.com/personality-types', @doc, @document)}
  
  describe '#web_scraper' do
    it "when scrapping and count method used" do
      expect(scrap.web_scraper).to eql(false)
    end
  end
  
end
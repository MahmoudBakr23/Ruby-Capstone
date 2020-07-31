require_relative '../app'
require 'test/unit'
require 'test/unit/ui/console/testrunner'

class ScrapTest < Test::Unit::TestCase

  def test_scrapping
    assert_equal 16, Scrap.new('https://www.16personalities.com/personality-types', @doc, @document).web_scraper
  end

  def test_scrapping_articles
    assert_equal 8, Scrap.new('https://www.16personalities.com/articles?category=all', @doc, @document).web_scraper_articles
  end
end

my_tests = Test::Unit::TestSuite.new('My Special Tests')
my_tests << ScrapTest.new('test_scrapping')
my_tests << ScrapTest.new('test_scrapping_articles')

Test::Unit::UI::Console::TestRunner.run(my_tests)

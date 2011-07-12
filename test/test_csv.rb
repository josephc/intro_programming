require 'hellocsv'

class TestHelloCsv < Test::Unit::TestCase
  def test_truth
    assert_equal true, true
  end

  def test_initialize_table
    app = HelloCsv.new
    app.use_csv("fixtures/test_hello.csv")
    assert_equal "fixtures/test_hello.csv", app.csv_file
    assert_equal 100, app.csv_table.size
    assert_equal(["_unit_id", "_created_at", "_golden", "_id", "_missed", "_started_at", "_tainted", "_channel", "_trust", "_worker_id", "_country", "_region", "_city", "_ip", "imdb", "imdb_worker_input", "no_imdb", "no_wikipedia", "wikipedia", "wikipedia_worker_input", "birth_name", "date_of_birth", "date_of_death", "first", "gender", "id", "imdb_gold", "last", "middle", "place_of_birth", "place_of_death", "url_to_imdb_main_name_page", "url_to_official_celebrity_website", "url_to_verified_twitter_account", "url_to_wikipedia_entry", "wikipedia_gold"],
      app.csv_table.headers)
  end

  def test_filter_table
    app = HelloCsv.new
    app.use_csv("fixtures/test_hello.csv")
    assert_equal([
        %Q{84873996,6/23/07 22:32,TRUE,148771553,,6/23/07 22:20,FALSE,amt,1,3103492,USA,FL,Miami,99.61.61.230,http://imdb.com/name/nm0172472/,http://www.imdb.com/name/nm0172472/,FALSE,FALSE,http://en.wikipedia.org/wiki/Lauren_Collins/,http://en.wikipedia.org/wiki/Lauren_Collins,,Aug 29 1986 12:00AM,,Lauren,F,173761,http://imdb.com/name/nm0172472/,Collins,,"Thornhill, Toronto, Ontario",,,,,,http://en.wikipedia.org/wiki/Lauren_Collins/}.parse_csv,
        %Q{84873996,6/23/07 22:42,TRUE,148776882,,6/23/07 22:36,FALSE,prodege,1,3094291,USA,CA,Burbank,204.128.192.4,http://imdb.com/name/nm0172472/,http://www.imdb.com/name/nm0172472/,FALSE,FALSE,http://en.wikipedia.org/wiki/Lauren_Collins/,http://en.wikipedia.org/wiki/Lauren_Collins,,Aug 29 1986 12:00AM,,Lauren,F,173761,http://imdb.com/name/nm0172472/,Collins,,"Thornhill, Toronto, Ontario",,,,,,http://en.wikipedia.org/wiki/Lauren_Collins/}.parse_csv
      ], app.filter("84873996"))
  end

end


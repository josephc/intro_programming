require 'hellocsv'

class TestHelloCsv < Test::Unit::TestCase
  def test_truth
    assert_equal true, true
  end

  def test_prompt
    app = HelloCsv.new
  end
end

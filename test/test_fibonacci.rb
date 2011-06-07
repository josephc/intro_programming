require "fibonacci"

class TestFibonacciApp < Test::Unit::TestCase
  def setup
    @app = FibonacciApp.new "5"
  end

  def test_creation
    assert_equal ["5"], @app.args
  end

  def test_output_defaults_to_stdout
    assert_equal $stdout, @app.output_stream
  end
end

class TestFibonacciOutput < Test::Unit::TestCase

  class FakeOutputStream
    attr_reader :contents

    def initialize
      @contents = []
    end

    def puts( value )
      @contents.push value
    end
  end

  def setup
    @fakeout = FakeOutputStream.new
  end

  def test_simple_run
    @app = FibonacciApp.new "1"
    @app.output_stream = @fakeout
    @app.run

    assert_equal [1], @fakeout.contents
  end

  def test_complex_run
    @app = FibonacciApp.new "5"
    @app.output_stream = @fakeout
    @app.run

    assert_equal [1,1,2,3,5], @fakeout.contents
  end
end

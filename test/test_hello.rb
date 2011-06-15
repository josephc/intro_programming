require 'hello'

class TestHello < Test::Unit::TestCase
  def test_truth
    assert_equal true, true
  end

  def test_creation
    app = Hello.new
  end

  def test_get_nil_name
    app = Hello.new
    assert_equal app.name, nil
  end

  class FakeConsole
    def read
      @data
    end

    def puts(data)
      @data = data
    end
  end

  def test_prompt
    app = Hello.new
    fake_console = FakeConsole.new
    app.console = fake_console
    app.prompt
    assert_equal "What's your name?", fake_console.read 
  end

  def test_default_console
    app = Hello.new
    assert_equal $stdout, app.console
  end
end

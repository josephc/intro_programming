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

  class FakeOutputConsole
    def read
      @data
    end

    def puts(data)
      @data = data
    end
  end

  class FakeInputConsole
    def set(name)
      @name = name
    end
    
    def gets
      @name
    end
  end

  def test_prompt
    app = Hello.new
    output_console = FakeOutputConsole.new
    app.output_console = output_console
    app.prompt
    assert_equal "What's your name?", output_console.read 
  end

  def test_default_console
    app = Hello.new
    assert_equal $stdout, app.output_console
    assert_equal $stdin, app.input_console
  end

  def test_read_prompt
    app = Hello.new
    input_console = FakeInputConsole.new
    input_console.set "George\n"
    app.input_console = input_console
    app.prompt_read
    assert_equal "George", app.name

    output_console = FakeOutputConsole.new
    app.output_console = output_console
    app.hello

    assert_equal "Hi, George!", output_console.read
  end
end

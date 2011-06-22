class Hello
  def initialize
    @output_console = $stdout
    @input_console = $stdin
  end

  attr_reader :name
  attr_accessor :input_console, :output_console

  # DRY = "don't repeat yourself"

  def prompt
    @output_console.puts "What's your name?"
  end

  def prompt_read
    @name = @input_console.gets.chomp
  end

  def hello
    @output_console.puts "Hi, #{@name}!"
  end
end

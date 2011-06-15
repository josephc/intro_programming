class Hello
  def initialize
    @console = $stdout
  end

  def name
    nil
  end

  def console=(console)
    @console = console
  end

  def console
    @console
  end

  def prompt
    @console.puts "What's your name?"
  end
end

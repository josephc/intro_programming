# fibonacci.rb
#
#

class FibonacciApp
  attr_reader :args
  attr_accessor :output_stream

  def initialize( *args )
    @args = args
    @output_stream = $stdout
  end

  def run
    a, b = 1,1
    count.times do
      @output_stream.puts a
      a,b = b, a + b
    end
  end

  private
  def count
    @args.first.to_i
  end
end

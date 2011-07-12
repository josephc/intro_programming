class Hello
  
  def initialize
    @output_console = $stdout
    @input_console = $stdin
    
    @store_data = []
  end
  
  attr_reader :name
  attr_accessor :input_console, :output_console
  
  def prompt
    ask_name = ["first name", "middle initial", "last name"]
    ask_name.each { |name| 
      @output_console.puts "What's your #{name}"
      @store_data << @input_console.gets.chomp
     }
  end
  def hey_there
    if @store_data == ["Brian","P","O'Rourke"]
      @output_console.puts "OMG TEACH, SUP?"
    else
      @output_console.puts "Hi, #{@store_data.join(" ")}!"
    end
  end
end

# take full csv
# prompt for unit_id
# output the data associated with this unit_id 
# the excel filter is equivalant
# job 54054

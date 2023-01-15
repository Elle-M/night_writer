class NightWriter
  attr_accessor :read_file,
                :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end

  def read_and_write
    message = File.open(@read_file, 'r')
 
    text = message.read

    puts "Created #{@write_file} contains #{text.split('').count} characters"
    # require 'pry'; binding.pry
    File.write(@write_file, text)
  end 
end


  # night_writer = NightWriter.new
  # night_writer.read_and_write

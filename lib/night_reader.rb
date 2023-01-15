require './alphabetable'

class NightReader
  attr_accessor :read_file,
                :write_file
  include Alphabetable

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end

  def read_and_write
    message = File.read(@read_file)
    
    # text = message.read
    
    char_count = message.chars.count
    # require 'pry'; binding.pry
    # require 'pry'; binding.pry
    # puts "Created #{@write_file} contains #{text.split('').count} characters"
    puts "Created #{@write_file} contains #{char_count} characters"
    
    translated_text = braile_to_text(message)
    # require 'pry'; binding.pry
    File.write(@write_file, translated_text)
    # File.write(@write_file, text)
  end 

  def braile_to_text(message)
    # message = File.open(@read_file)
    text_message = message.chars.filter_map do |letter|
      braile_to_letter[letter]
      require 'pry'; binding.pry
    end
    # sliced_array = braille_message.transpose.map do |braille|
    #   # braille.join.chars.each_slice(80).map do |slice|
    #   #   slice.join
    #   braille.join.chars.each_slice(80).map(&:join)
    
    # end.transpose.join("\n")
  end  
end

# night_reader = NightReader.new
# night_reader.read_and_write
require_relative './alphabetable'

class NightWriter

  attr_accessor :read_file,
                :write_file
  include Alphabetable
  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end

  def read_and_write
    message = File.read(@read_file)
    char_count = message.length
    translated_text = text_to_braile(message)
    File.write(@write_file, translated_text)
    puts "Created #{@write_file} contains #{char_count} characters"
  end 

  def text_to_braile(message)
    braille_message = message.chars.filter_map do |letter|
      letter_to_braille[letter]
    end
    braille_message.transpose.map do |braille|
      braille.join.chars.each_slice(80).map(&:join)
    end.transpose.join("\n")
  end
end
#comment out runner to run rspec
# night_writer = NightWriter.new
# night_writer.read_and_write


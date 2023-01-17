require_relative './alphabetable'
class NightReader

  attr_accessor :read_file,
                :write_file
  include Alphabetable
  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end

  def read_and_write
    braille_message = File.read(@read_file)
    translated_text = braille_to_text(braille_message)
    File.write(@write_file, translated_text)
    message = File.read(@write_file)
    char_count = message.chars.count
    puts "Created #{@write_file} contains #{char_count} characters"
  end

  def braille_to_text(braille_message)
    braille_message_array = braille_message.split("\n")
    braille_arrays = braille_message_array.map do |braille_array|
      braille_array.chars.each_slice(2).map do |char|
        char
      end
    end
    new_braille_message_array = braille_arrays.map do |braille_array|
      braille_array.map do |string_join|
        string_join.join
      end
    end
    braille_to_letter_key = new_braille_message_array.transpose
    translation_braille_to_text = braille_to_letter_key.filter_map do |letter|
      braille_to_letter[letter]
    end.join
  end 
end
#comment out runner to run rspec
# night_reader = NightReader.new
# night_reader.read_and_write
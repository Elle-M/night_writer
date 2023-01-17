require_relative './alphabetable'
class NightReader
  attr_accessor :read_file,
                :write_file
  # attr_reader :alphabet
  include Alphabetable

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    # @alphabet = {
    #   "a" => ["0.", "..", ".."],
    #   "b" => ["00", "..", ".."],
    #   "c" => ["0.", ".0", ".."],
    #   "d" => ["0.", ".0", "0."],
    #   "e" => ["0.", "..", "0."],
    #   "f" => ["00", ".0", ".."],
    #   "g" => ["00", ".0", "0."],
    #   "h" => ["00", "..", "0."],
    #   "i" => [".0", ".0", ".."],
    #   "j" => [".0", ".0", "0."],
    #   "k" => ["0.", "0.", ".."],
    #   "l" => ["00", "0.", ".."],
    #   "m" => ["0.", "00", ".."],
    #   "n" => ["0.", "00", "0."],
    #   "o" => ["0.", "0.", "0."],
    #   "p" => ["00", "00", ".."],
    #   "q" => ["00", "00", "0."],
    #   "r" => ["00", "0.", "0."],
    #   "s" => [".0", "00", ".."],
    #   "t" => [".0", "00", "0."],
    #   "u" => ["0.", "0.", ".0"],
    #   "v" => ["00", "0.", ".0"],
    #   "w" => [".0", ".0", "00"],
    #   "x" => ["0.", "00", ".0"],
    #   "y" => ["0.", "00", "00"],
    #   "z" => ["0.", "0.", "00"]
    #   }
    end


  def read_and_write
    braille_message = File.read(@read_file)
    # require 'pry'; binding.pry
    message = File.read(@write_file)
    char_count = message.chars.count
    #refactor to count text
    puts "Created #{@write_file} contains #{char_count} characters"
    
    translated_text = braille_to_text(braille_message)
    
    File.write(@write_file, translated_text)
  end

  # def braille_to_letter
  #   alphabet.invert
  # end
# require 'pry'; binding.pry
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
    # require 'pry'; binding.pry
    # braille_character = new_braille_message_array.each_slice(3).map do |braille_char|
    #   braille_char if braille_char == braille_to_letter.keys_any?(braille_char)
  #  tanspose
      # braille_char 
  end
    
#returns ["00", "0.", "00"]
   
    # require 'pry'; binding.pry
    # braille_character.map do |braille|
    #     braille if braille == braille_to_letter.keys 
      # end
end

# night_reader = NightReader.new
# night_reader.read_and_write
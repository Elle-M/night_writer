require './alphabetable'

class NightReader
  attr_accessor :read_file,
                :write_file
  include Alphabetable

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end
end
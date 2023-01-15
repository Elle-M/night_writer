require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) { NightReader.new }
  before do
    night_reader.read_file =  './braille.txt'
    night_reader.write_file = './message.txt'
  end
  it 'exists' do
    expect(night_reader).to be_a(NightReader)
  end
end
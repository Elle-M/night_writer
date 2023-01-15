require_relative 'spec_helper'
# require './lib/night_writer'

RSpec.describe NightWriter do
  let(:night_writer) { NightWriter.new }
  before do
    night_writer.read_file = './message.txt'
    night_writer.write_file = './braille.txt'
  end
  it 'exists' do
    expect(night_writer).to be_a(NightWriter)
  end

  it 'has attributes' do
    #combine with attr_reader
    # allow(night_writer).to recieve(:read_file).and_return('./message.txt')
    # allow(night_writer).to recieve(:read_file).and_return('./braille.txt')
    night_writer.read_and_write

    expect(night_writer.read_file).to eq('./message.txt')
    expect(night_writer.write_file).to eq('./braille.txt')
  end

  it 'has a hash that has letters keys and braille values' do
    expect(night_writer.alphabet.first).to eq(["a", ["0.", "..", ".."]])
  end
end
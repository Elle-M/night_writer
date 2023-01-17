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

  it 'write a letter to braile' do
    expect(night_writer.text_to_braile('h')).to eq( "0.\n00\n..")
  end

  it 'write word to braile' do
    expect(night_writer.text_to_braile('hello')).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
  end

  it 'can line break at 80 characters' do
    message = 'hello hello hello hello hello hello hello hello hello hello hello hello hello hello'

    expect(night_writer.text_to_braile(message).chars.length).to eq(425)
    expect(night_writer.text_to_braile(message).lines.count).to eq(6)
  end
end
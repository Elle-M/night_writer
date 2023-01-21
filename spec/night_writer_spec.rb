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
    night_writer.read_and_write

    expect(night_writer.read_file).to eq('./message.txt')
    expect(night_writer.write_file).to eq('./braille.txt')
  end

  it 'has a hash that has letters keys and braille values' do
    expect(night_writer.alphabet.first).to eq(["a", ["0.", "..", ".."]])
  end

  it '#text_to_braile can write a letter to braile' do
    expect(night_writer.text_to_braile('h')).to eq( "0.\n00\n..")
  end

  it '#text_to_braile can write word to braile' do
    expect(night_writer.text_to_braile('hello')).to eq("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
  end

  it '#text_to_braile can line break at 80 characters' do
    message = 'hello hello hello hello hello hello hello hello hello hello hello hello hello hello'

    expect(night_writer.text_to_braile(message).chars.length).to eq(506)
    expect(night_writer.text_to_braile(message).lines.count).to eq(9)
  end

  it '#text_to_braile does not line break before 80 characters' do
    eighty_char_count = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    expected = '0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
................................................................................
................................................................................'
    expect(night_writer.text_to_braile(eighty_char_count)).to eq(expected)
  end

  it '#text_to_braile does break after 80 characters' do
    eighty_two_char_count = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    expected = '0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
................................................................................
................................................................................
0.
..
..'
    expect(night_writer.text_to_braile(eighty_two_char_count)).to eq(expected)
  end
end
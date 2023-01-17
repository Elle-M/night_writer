require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) { NightReader.new }
  before do
    night_reader.read_file =  './braille.txt'
    night_reader.write_file = './original_message.txt'
  end
  it 'exists' do
    expect(night_reader).to be_a(NightReader)
  end

  it 'has attributes' do
    #combine with attr_reader
    # allow(night_writer).to recieve(:read_file).and_return('./message.txt')
    # allow(night_writer).to recieve(:read_file).and_return('./braille.txt')
    night_reader.read_and_write

    expect(night_reader.read_file).to eq('./braille.txt')
    expect(night_reader.write_file).to eq('./original_message.txt')
  end

  it 'has a hash that has braille keys and letter values' do
    expect(night_reader.braille_to_letter.first).to eq([["0.", "..", ".."], "a"])
  end 

  it "#braile_to_text" do
    expect(night_reader.braille_to_text("0.\n00\n..")).to eq('h')
  end 

  it "#braile_to_text can take a word" do
    word = "0.0.0.0.0.\n00.00.0..0\n....0.0.0."
    expect(night_reader.braille_to_text(word)).to eq('hello')
  end  
end
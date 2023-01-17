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
    night_reader.read_and_write

    expect(night_reader.read_file).to eq('./braille.txt')
    expect(night_reader.write_file).to eq('./original_message.txt')
  end

  it 'has a hash that has braille keys and letter values' do
    expect(night_reader.braille_to_letter.first).to eq([['0.', '..', '..'], 'a'])
  end 

  it '#braile_to_text can write a letter to braile' do
    expect(night_reader.braille_to_text('0.\n00\n..')).to eq('h')
  end 

  it '#braile_to_text write word to braile' do
    word = '0.0.0.0.0.\n00.00.0..0\n....0.0.0.'
    expect(night_reader.braille_to_text(word)).to eq('hello')
  end  

  it '#braile_to_text does rejoin from above 80 characters' do
    eighty_two_char_count = '0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.
................................................................................
................................................................................
0.
..
..'
    expected = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    #format expected better?
    expect(braille_to_text(eighty_two_char_count)).to eq(expected)
  end
end
require_relative '../roman_numerals'

describe 'converting an Arabic number to a Roman numeral' do
  describe 'old Roman numerals' do
    it 'converts 1 to I' do
      expect(convert_to_roman(1)).to eq "I"
    end

    it 'converts 4 to IIII' do
      expect(convert_to_roman(4)).to eq "IIII"
    end

    it 'converts 72 to LXXII' do
      expect(convert_to_roman(72)).to eq "LXXII"
    end

    it 'converts 9572 to MMMMMMMMMDLXXII' do
      expect(convert_to_roman(9572)).to eq "MMMMMMMMMDLXXII"
    end

  end

  describe 'modern Roman numerals' do
    # Release 3 ...
    # add tests for modern roman numerals here

  end
end

require_relative '../anagrams'

describe 'anagram_canonical_form' do
  let(:w) {"melon".downcase.chars.sort!}

  context 'when the word is passed' do
    it 'formats to downcase, then chars, then sort!' do
      key_word = anagram_canonical_form("melon")
      expect(key_word).to eq ["e", "l", "m", "n", "o"]
    end
  end

end

describe 'anagrams?' do
  let(:true_return) { 'Yes, it is.' }
  let(:false_return) { 'No.  It\'s not.' }

  context 'after words are formatted they will be compared' do
    it 'checks if the letters are the same in each array.' do
      expect(anagrams?('melon', 'lemon')).to eq true_return
    end
  end

  context 'after words are formatted they will be compared' do
    it 'checks if the letters are the same in each array.' do
      expect(anagrams?('lemon', 'melon')).to eq true_return
    end
  end

  context 'after words are formatted they will be compared' do
    it 'checks if the letters are the same in each array.' do
      expect(anagrams?('melon', 'melon')).to eq true_return
    end
  end

  context 'after words are formatted they will be compared' do
    it 'checks if the letters are the same in each array.' do
      expect(anagrams?('MELON', 'lemon')).to eq true_return
    end
  end

  context 'after words are formatted they will be compared' do
    it 'checks if the letters are the same in each array.' do
      expect(anagrams?('abcde2', 'c2abed')).to eq true_return
    end
  end

  context 'after words are formatted they will be compared' do
    it 'checks if the letters are the same in each array.' do
      expect(anagrams?('kilso', 'osilk')).to eq true_return
    end
  end

end

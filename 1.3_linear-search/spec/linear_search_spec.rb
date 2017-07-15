require_relative '../linear_search'

describe 'linear_search' do
  let(:symbols) { [:Q, :O, :A, :A, :C, :G, :S, :U] }

  context 'when the array contains the searched-for element' do
    it 'returns the index of the first occurrence of the element' do
      index_of_a = linear_search(:A, symbols)
      expect(index_of_a).to eq 2
    end
  end

  context 'when the array does not contain the searched-for element' do
    it 'returns nil if the element cannot be found' do
      index_of_z = linear_search(:Z, symbols)
      expect(index_of_z).to eq nil
      # expect(true).to be_falsy, "Hey DBC Student! We wrote a test that was guaranteed to fail. Open up the spec: 'when the array does not contain the searched-for element' and write reasonable test code written by you, the student."
    end
  end
end


describe 'global_linear_search' do
  let(:letter) {"bananas".chars}

  context 'when the array contains the searched-for element' do
    it 'returns the indices where element is found' do
      index_of_a = global_linear_search("a", letter)
      expect(index_of_a).to eq [1, 3, 5]
    end
  end

  context 'when the array contains the searched-for element' do
    it 'returns the index where element is found' do
      index_of_a = global_linear_search("b", letter)
      expect(index_of_a).to eq [0]
    end
  end

  context 'when the array does not contain the searched-for element' do
    it 'returns nil if the element cannot be found' do
      index_of_z = linear_search("z", letter)
      expect(index_of_z).to eq nil
    end
  end
end

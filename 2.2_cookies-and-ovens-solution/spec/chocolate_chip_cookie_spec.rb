require_relative '../chocolate_chip_cookie'

describe ChocolateChipCookie do
  describe 'Chocolate Chip Cookie Class' do
    let(:cookie) { ChocolateChipCookie.new }

    it 'can report its type' do
      expect(cookie.type).to eq 'chocolate chip'
    end

    it 'can report cookie is :doughy' do
      expect(cookie.status).to eq :doughy
    end

    it 'can report cookie is :almost ready' do
      almost_ready = ChocolateChipCookie.new({ baked_time: 24 })
      expect(almost_ready.status).to eq :almost_ready
    end

    it 'can report cookie is :ready' do
      ready = ChocolateChipCookie.new({ baked_time: 25 })
      expect(ready.status).to eq :ready
    end

    it 'can report cookie is :burned' do
      burned = ChocolateChipCookie.new({ baked_time: 30 })
      expect(burned.status).to eq :burned
    end

    it 'it can bake the cookie 1 minute' do
      expect{ cookie.bake }.to change{ cookie.current_bake_time }.by(1)
    end

    it 'can report true if done (or burned)' do
      done = ChocolateChipCookie.new({ baked_time: 25 })
      expect(done.cooked?).to eq true
    end
  end
end

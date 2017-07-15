require_relative '../sugar_cookie'

describe SugarCookie do
  describe 'Chocolate Chip Cookie Class' do
    let(:cookie) { SugarCookie.new }

    it 'can report its type' do
      expect(cookie.type).to eq 'sugar'
    end

    it 'can report cookie is :doughy' do
      expect(cookie.status).to eq :doughy
    end

    it 'can report cookie is :almost ready' do
      almost_ready = SugarCookie.new({ baked_time: 19 })
      expect(almost_ready.status).to eq :almost_ready
    end

    it 'can report cookie is :ready' do
      ready = SugarCookie.new({ baked_time: 20 })
      expect(ready.status).to eq :ready
    end

    it 'can report cookie is :burned' do
      burned = SugarCookie.new({ baked_time: 30 })
      expect(burned.status).to eq :burned
    end

    it 'it can bake the cookie 1 minute' do
      expect{ cookie.bake }.to change{ cookie.current_bake_time }.by(1)
    end

    it 'can report true if done (or burned)' do
      done = SugarCookie.new({ baked_time: 20 })
      expect(done.cooked?).to eq true
    end
  end
end

require_relative '../peanut_butter_cookie'

describe PeanutButterCookie do
  describe 'Peanut Butter Cookie Class' do
    let(:cookie) { PeanutButterCookie.new }

    it 'can report its type' do
      expect(cookie.type).to eq 'peanut butter'
    end

    it 'can report cookie is :doughy' do
      expect(cookie.status).to eq :doughy
    end

    it 'can report cookie is :almost ready' do
      almost_ready = PeanutButterCookie.new({ baked_time: 29 })
      expect(almost_ready.status).to eq :almost_ready
    end

    it 'can report cookie is :ready' do
      ready = PeanutButterCookie.new({ baked_time: 30 })
      expect(ready.status).to eq :ready
    end

    it 'can report cookie is :burned' do
      burned = PeanutButterCookie.new({ baked_time: 33 })
      expect(burned.status).to eq :burned
    end

    it 'it can bake the cookie 1 minute' do
      expect{ cookie.bake }.to change{ cookie.current_bake_time }.by(1)
    end

    it 'can report true if done (or burned)' do
      done = PeanutButterCookie.new({ baked_time: 30 })
      expect(done.cooked?).to eq true
    end
  end
end

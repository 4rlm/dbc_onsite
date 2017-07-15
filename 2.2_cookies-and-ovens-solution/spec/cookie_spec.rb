require_relative '../cookie'

describe Cookie do
  describe 'Cookie Class' do
    let(:cookie) { Cookie.new }

    it 'can report its type' do
      expect(cookie.type).to eq 'generic'
    end

    it 'can report cookie is :doughy' do
      expect(cookie.status).to eq :doughy
    end


    it 'can report cookie is :almost ready' do
      almost_ready = Cookie.new({ baked_time: 9 })
      expect(almost_ready.status).to eq :almost_ready
    end

    it 'can report cookie is :ready' do
      ready = Cookie.new({ baked_time: 10 })
      expect(ready.status).to eq :ready
    end

    it 'can report cookie is :burned' do
      burned = Cookie.new({ baked_time: 15 })
      expect(burned.status).to eq :burned
    end

    it 'it can bake the cookie 1 minute' do
      expect{ cookie.bake }.to change{ cookie.current_bake_time }.by(1)
    end

    it 'can report true if done (or burned)' do
      done = Cookie.new({ baked_time: 10 })
      expect(done.cooked?).to eq true
    end
  end
end

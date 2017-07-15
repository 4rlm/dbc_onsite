require_relative '../oven'
require_relative '../cookie'
require_relative '../sugar_cookie'

describe Oven do
  describe 'Cookie Class' do
    let(:oven) { Oven.new }
    cookies = []
    5.times do
      cookies << Cookie.new
    end

    sugar_cookies = []
    5.times do
      sugar_cookies << SugarCookie.new
    end

    it 'can add a batch of cookies to rack' do
      expect{ oven.add_batch(cookies) }.to  change{ oven.rack.length }.by(5)
    end

    it 'can turn on oven' do
      expect{ oven.turn_on(350) }.to change { oven.on }.from(false).to(true)
      expect(oven.temp).to eq 350
    end

    it 'can return false for uncooked cookies' do
      oven.add_batch(cookies)
      expect(oven.check_batch).to include(false)
    end

    it 'can return true for cooked cookies' do
      oven.add_batch(cookies)
      oven.bake_batch(25)
      expect(oven.check_batch).to include(true)
    end

    it 'can remove a batch of cookies' do
      oven.add_batch(cookies)
      expect(oven.remove_batch).to include(Cookie)
      expect(oven.rack).to be_empty
    end

    it 'can remove just one type of cookie' do
      oven.add_batch(cookies)
      oven.add_batch(sugar_cookies)
      expect(oven.rack).to include(Cookie, SugarCookie)
      oven.remove_batch('sugar')
      expect(oven.rack).not_to include(SugarCookie)
    end
  end
end

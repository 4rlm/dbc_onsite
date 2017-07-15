require_relative 'cookie'
require_relative 'oven'
require_relative 'chocolate_chip_cookie'
require_relative 'peanut_butter_cookie'
require_relative 'oatmeal_cookie'
require_relative 'sugar_cookie'

cookies = []
10.times do
  cookies << ChocolateChipCookie.new
  cookies << PeanutButterCookie.new
  cookies << OatmealCookie.new
  cookies << SugarCookie.new
end

oven = Oven.new

oven.turn_on(350)
p oven
oven.add_batch(cookies)
p oven.check_batch
oven.bake_batch(20)
p oven.check_batch
sugar = oven.remove_batch('sugar')
oven.bake_batch(5)
p oven.check_batch
choclate = oven.remove_batch('chocolate chip')
gross_cookies = oven.remove_batch('gross')
p oven.check_batch
oven.bake_batch(5)
p oven.check_batch
peanut_butter = oven.remove_batch
p oven.check_batch
oven.turn_off
p oven
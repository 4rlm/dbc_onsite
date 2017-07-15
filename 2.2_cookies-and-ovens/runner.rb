require_relative 'choco_cookie'
require_relative 'oat'
require_relative 'oven'

choco = ChocoCookie.new
oat = OatCookie.new
oven = Oven.new

# Start baking
puts "Start baking"
oven.add_batch([choco, oat]) # doughy

# 5 mins
puts "5 mins"
oven.add_time
oven.check_status_all # doughy

# 10 mins
puts "10 mins"
oven.add_time
oven.check_status_all # doughy

# 15 mins
puts "15 mins"
oven.add_time
oven.check_status_all # choco: doughy, oat: done

oven.remove_batch
puts "Your current cookies: #{oven.current_batch}"

# 20 mins
puts "20 mins"
oven.add_time
oven.check_status_all # choco: done, oat: burn

# 25 mins
puts "25 mins"
oven.add_time
oven.check_status_all # choco: burn, oat: burn

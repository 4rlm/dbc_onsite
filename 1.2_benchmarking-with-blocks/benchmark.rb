# Accepts a block and returns how many seconds
# it takes to execute the code in the block.

def benchmark
  start_time = Time.now
  calculation = yield
  end_time = Time.now
  run_time = end_time - start_time
  run_time
end

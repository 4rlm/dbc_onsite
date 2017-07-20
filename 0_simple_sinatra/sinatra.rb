require 'sinatra'
require 'active_record'
require 'pathname'

set :views, File.join(File.dirname(__FILE__), "views")

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

# get '/' do
#   "Hello world!"
# end

require_relative 'controllers/index'

# shotgun sinatra.rb
# http://localhost:4567
# http://localhost:9393

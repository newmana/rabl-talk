%w(rubygems sinatra rabl active_record rgeo active_support/core_ext active_support/inflector builder).each do |lib|
  require lib
end

Rabl.register!

Sinatra::Application.configure do
  set :views, File.join(File.dirname(__FILE__), '../views')
end

ENV['ENV'] = Sinatra::Application.environment.to_s

require './lib/database.rb'
require './lib/models.rb'
load 'app.rb'

run Sinatra::Application
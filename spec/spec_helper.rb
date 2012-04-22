%w(rubygems sinatra rabl active_record rgeo active_support/core_ext active_support/inflector builder).each do |lib|
  require lib
end

Rabl.register!

Sinatra::Application.configure do
  set :views, File.join(File.dirname(__FILE__), '../views')
end

ENV['ENV'] = Sinatra::Application.environment.to_s

require File.join(File.dirname(__FILE__), '../lib', 'database.rb')
require File.join(File.dirname(__FILE__), '../lib', 'models.rb')

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'sinatra'
require 'rack/test'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
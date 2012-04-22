settings = YAML.load_file(File.join(File.dirname(__FILE__), '../config', 'database.yml'))
env = ENV['ENV'] ? ENV['ENV'] : 'development'
ActiveRecord::Base.establish_connection(settings[env])

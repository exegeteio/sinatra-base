# Main Application.
require 'haml'
require 'logger'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/reloader'

# Log more quickly.
$stdout.sync = true

class App < Sinatra::Base
  register Sinatra::Reloader

  configure do
    $logger = Logger.new(STDOUT)
    set :haml, :format => :html5
    set :static_cache_control, [:public, :max_age => 300]
    set :public_folder, File.dirname(__FILE__) + '/static'
  end

  get '/status' do
    content_type 'application/json'
    ActiveRecord::Base.connection.execute("SELECT now()").first.to_json
  end

  get '/' do
    haml '%div.title Hello World'
  end
end

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

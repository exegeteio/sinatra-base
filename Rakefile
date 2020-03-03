require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'

require 'bundler/audit/task'
Bundler::Audit::Task.new

task test: 'bundle:audit'

$:.unshift(File.dirname(__FILE__) + '/../lib')

begin
  require 'simplecov'
  SimpleCov.start 'rails'
rescue Exception => e
  puts "SimpleCov couldn't be found. Simplecov is a Ruby Coverage tool. Please run `gem install simplecov` if you'd like to see the code coverage."
end

require 'rubygems'
require 'bundler/setup'
require 'logger'

require 'active_record'

require 'revisionable'

Runner::TaskHandler.logger = Logger.new('/tmp/test.log')
ENV['RAILS_ENV'] = 'test'

ActiveRecord::Base.configurations = {'test' => {:adapter => 'sqlite3', :database => 'test.sqlite3'}}
ActiveRecord::Base.establish_connection
ActiveRecord::Base.logger = Runner::TaskHandler.logger
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :revisionable_test, :force => true do |table|
    
    table.timestamps
  end
end

# Purely useful for test cases...
class RevisionableTest < ActiveRecord::Base
  
end

# Add this directory so the ActiveSupport autoloading works
ActiveSupport::Dependencies.autoload_paths << File.dirname(__FILE__)

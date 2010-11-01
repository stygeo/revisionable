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
require 'factory_girl_rails'

require 'revisionable'

ENV['RAILS_ENV'] = 'test'

ActiveRecord::Base.configurations = {'test' => {:adapter => 'sqlite3', :database => 'test.sqlite3'}}
ActiveRecord::Base.establish_connection
ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do
  create_table :revisionable_tests, :force => true do |table|
    table.string :name
    table.text :description
    table.integer :revision_parent_id

    table.timestamps
  end
end

# Purely useful for test cases...
class RevisionableTest < ActiveRecord::Base
  revisionable
end

# Add this directory so the ActiveSupport autoloading works
ActiveSupport::Dependencies.autoload_paths << File.dirname(__FILE__)
Dir["#{File.dirname(__FILE__)}/factories/*.rb"].each {|f| require f} 
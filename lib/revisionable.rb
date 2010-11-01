require 'active_record'
require 'active_support'

require File.dirname(__FILE__) + '/revisionable/control'
require File.dirname(__FILE__) + '/revisionable/active_record'
require File.dirname(__FILE__) + '/revisionable/engine' if defined? Rails && Rails::VERSION::MAJOR == 3

ActiveRecord::Base.send(:include, Revisionable::Control)

module Revisionable
  # TODO Add configuration
  
  def setup
    yield self
  end
end
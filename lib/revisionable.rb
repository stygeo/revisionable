require 'active_record'
require 'active_support'

ActiveSupport.include(Revisionable::Control)

module Revisionable
  # TODO Add configuration
  
  def setup
    yield self
  end
end
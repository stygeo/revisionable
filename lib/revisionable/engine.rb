require 'revisionable'
require 'rails'

module Revisionable
  class Engine < Rails::Engine
    rake_tasks do
      # Include rake tasks
    end
  end
end
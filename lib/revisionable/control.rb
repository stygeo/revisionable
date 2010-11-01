module Revisionable
  module Control
    extend ActiveSupport::Concern
    
    module ClassMethods
      def revisionable(options = {})
        alias_method :orig_update_attribute, :update_attribute
        self.send(:include, Revisionable::ActiveRecord)
      end
    end
    
    def fork!
      self.childs.build(self.attributes)
    end
  end
end
module Revisionable
  module ActiveRecord
    extend ActiveSupport::Concern
    
    included do
      belongs_to :parent, :class_name => model_name.to_s, :foreign_key => :revision_parent_id
      has_many :childs, :class_name => model_name.to_s, :foreign_key => :revision_parent_id
    end
    
    # Overwrite this method. We want to create a new record when the current record is being updated
    def update_attribute(name, value, options = {})
      options.reverse_merge!({:fork => true})
      
      if !options[:fork]
        return orig_update_attribute(name, value)
      else
        if child = self.childs.create({name => value})
          return child
        end
      end
      
      return false
    end
    
    def update_attributes(attributes)
      attributes.reverse_merge!({:fork => true})
      
      if !attributes[:fork]
        # Remove the fork 'attributes' for the sake of AR
        attributes.delete(:fork)
        return super
      else
        attributes.delete_if {|k,| k == :fork}
        
        if child = self.childs.create(attributes)
          return child
        end
      end
      
      return false
    end
  end
end
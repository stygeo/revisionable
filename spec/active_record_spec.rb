require 'spec_helper'

describe Revisionable::ActiveRecord do
  let(:revisionable_test) { Factory(:revisionable_test) }
  
  it "should be possible to have a parent" do
    revisionable_test.should respond_to :parent
  end

  it "should be possible to have childs" do
    revisionable_test.should respond_to :childs
  end

  context "being the root element" do
    it "should not have a parent" do
      revisionable_test.parent.should be nil
    end
    
    context "when one attribute is updated" do
      context "without specifying to skip forking" do
        before do
          @revisionable_copy = revisionable_test.update_attribute(:name, "New name")
        end
      
        it "should not return true on success" do
          @revisionable_copy.should_not be true
        end
      
        it "should return false when an error occurs" do
          pending
        end
      
        it "should create a new record" do
          @revisionable_copy.should be_kind_of RevisionableTest
          @revisionable_copy.should_not eq revisionable_test
        end
      end
      
      context "with specifying to skip forking" do
        before do
          @revisionable_copy = revisionable_test.update_attribute(:name, "New name", :fork => false)
        end
        
        it "should return true on success" do
          @revisionable_copy.should be true
        end
        
        it "should return false when an error occurs" do
          pending
        end
      end
    end
    
    context "when multiple attributes are updated" do
      let(:attributes) { {:name => "New name", :description => "New description"} }
      
      context "without specifying to skip forking" do
        before do
          @revisionable_copy = revisionable_test.update_attributes(attributes)
        end
      
        it "should not return true on success" do
          @revisionable_copy.should_not be true
        end
      
        it "should return false when an error occurs" do
          pending
        end
      
        it "should create a new record" do
          @revisionable_copy.should be_kind_of RevisionableTest
          @revisionable_copy.should_not eq revisionable_test
        end
      end
      
      context "with specifying to skip forking" do
        before do
          @revisionable_copy = revisionable_test.update_attributes(attributes.merge(:fork => false))
        end
        
        it "should return true on success" do
          @revisionable_copy.should be true
        end
        
        it "should return false when an error occurs" do
          pending
        end
      end
    end

  end

  context "not being the root element" do
    it "should have a parent" do
      revisionable_test.childs.create!(:name => "Another test")
      revisionable_test.childs.should_not eq 0
    end
  end
end
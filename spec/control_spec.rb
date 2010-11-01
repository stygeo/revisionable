require 'spec_helper'

describe Revisionable::Control do
  context "when a model is set up for revision control" do
    let(:revisionable_test) { Factory(:revisionable_test) }
    
    it "should implement a bunch of stuff" do
      RevisionableTest.should respond_to :revisionable
    end

    context "being forked" do
      it "should respond to fork and return a new record which have to be saved manually" do
        revisionable_test.should respond_to :fork!
        @copied_revisionable_test = revisionable_test.fork!
        @copied_revisionable_test.new_record?.should eq true
      end
      
      it "should match the attributes defined on the parent object" do
        @copied_revisionable_test = revisionable_test.fork!
        
        revisionable_test.attributes.each do |k,v|
          next if k.to_s == "revision_parent_id" || k.to_s == "id"
          @copied_revisionable_test.attributes[k].should eq v
        end
      end
    end
  end
end
require 'spec_helper'

describe Revisionable::Control do
  context "when a model is set up for revision control" do
    let(:revisionable_test) { Factory(:revisionable_test) }
    
    it "should implement a bunch of stuff" do
      RevisionableTest.should respond_to :revisionable
    end

    context "being forked" do
      it "should have child elements" do
        pending
      end
    end
  end
end
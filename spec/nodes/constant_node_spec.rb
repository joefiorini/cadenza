require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::ConstantNode do

   it "should equal a node with the same value" do
      Cadenza::ConstantNode.new(10).should == Cadenza::ConstantNode.new(10)
   end

   it "should not equal a node with a different value" do
      Cadenza::ConstantNode.new(20).should_not == Cadenza::ConstantNode.new(10)
   end

   it "should return an empty array for implied globals" do
      Cadenza::ConstantNode.new(20).implied_globals.should == []
   end
end
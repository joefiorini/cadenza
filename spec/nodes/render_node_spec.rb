require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::RenderNode do

   it "should equal a node with the same value" do
      render_a = Cadenza::RenderNode.new("somefile.cadenza")
      render_b = Cadenza::RenderNode.new("somefile.cadenza")

      render_a.should == render_b
   end

   it "should not equal a node with a different value" do
      render_a = Cadenza::RenderNode.new("somefile.cadenza")
      render_b = Cadenza::RenderNode.new("otherfile.cadenza")

      render_a.should_not == render_b
   end

end
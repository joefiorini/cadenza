require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::DocumentNode do

  before do
    @document_a = Cadenza::DocumentNode.new
    @document_b = Cadenza::DocumentNode.new
  end

  it "should be equal to another empty document" do
    @document_a.should == @document_b
  end

  it "should equal a document with the same child elements" do 
    @document_a.children.push(Cadenza::ConstantNode.new(10))
    @document_b.children.push(Cadenza::ConstantNode.new(10))

    @document_a.should == @document_b
  end

  it "should not equal a document with different child elements" do
    @document_a.children.push(Cadenza::ConstantNode.new(10))
    @document_b.children.push(Cadenza::ConstantNode.new(20))

    @document_a.should_not == @document_b
  end

  it "should not equal a document with different extends values" do
    @document_a.extends = "foo"
    @document_b.extends = "bar"

    @document_a.should_not == @document_b
  end

end
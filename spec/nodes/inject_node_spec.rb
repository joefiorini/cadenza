require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::InjectNode do

  it "should not equal a document with different values" do
    constant_a = Cadenza::ConstantNode.new(10)
    constant_b = Cadenza::ConstantNode.new(20)

    inject_a = Cadenza::InjectNode.new(constant_a)
    inject_b = Cadenza::InjectNode.new(constant_b)

    inject_a.should_not == inject_b
  end

  it "should equal a document with the same child elements" do 
    inject_a = Cadenza::InjectNode.new(Cadenza::ConstantNode.new(10))
    inject_b = Cadenza::InjectNode.new(Cadenza::ConstantNode.new(10))

    inject_a.should == inject_b
  end

end
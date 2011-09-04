require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::FilterNode do
  it "should take an identifier" do
    filter = Cadenza::FilterNode.new("trim")

    filter.identifier.should == "trim"
  end

  it "should take a list of parameter nodes" do
    constant_a = Cadenza::ConstantNode.new(10)

    filter = Cadenza::FilterNode.new("cut", [constant_a])

    filter.identifier.should == "cut"
    filter.parameters.should == [constant_a]
  end

  it "should return a list of it's parameters implied globals (unique)" do
    constant = Cadenza::ConstantNode.new(10)
    variable = Cadenza::VariableNode.new("x")

    filter = Cadenza::FilterNode.new("cut", [constant, variable, variable])

    filter.implied_globals.should == %w(x)
  end
end
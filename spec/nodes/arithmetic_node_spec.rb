require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::ArithmeticNode do

  it "should equal a node with the same operands and operator" do
    variable = Cadenza::VariableNode.new("x")
    constant = Cadenza::ConstantNode.new(1)

    Cadenza::ArithmeticNode.new(variable, "+", constant).should == Cadenza::ArithmeticNode.new(variable, "+", constant)
  end

  it "should not equal a node with a different operator" do
    variable = Cadenza::VariableNode.new("x")
    constant = Cadenza::ConstantNode.new(1)

    Cadenza::ArithmeticNode.new(variable, "+", constant).should_not == Cadenza::ArithmeticNode.new(variable, "-", constant)
  end

  it "should not equal a node with a different left operand" do
    variable_a = Cadenza::VariableNode.new("x")
    variable_b = Cadenza::VariableNode.new("y")
    constant = Cadenza::ConstantNode.new(1)

    Cadenza::ArithmeticNode.new(variable_a, "+", constant).should_not == Cadenza::ArithmeticNode.new(variable_b, "+", constant)
  end

  it "should not equal a node with a different right operand" do
    variable = Cadenza::VariableNode.new("x")
    constant_a = Cadenza::ConstantNode.new(1)
    constant_b = Cadenza::ConstantNode.new(9)

    Cadenza::ArithmeticNode.new(variable, "+", constant_a).should_not == Cadenza::ArithmeticNode.new(variable, "+", constant_b)
  end

end
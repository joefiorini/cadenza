require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::BooleanNode do
   it "should equal a node with the same operands and operator" do
      variable = Cadenza::VariableNode.new("x")
      constant = Cadenza::ConstantNode.new(1)

      Cadenza::BooleanNode.new(variable, "==", constant).should == Cadenza::BooleanNode.new(variable, "==", constant)
   end

   it "should not equal a node with a different operator" do
      variable = Cadenza::VariableNode.new("x")
      constant = Cadenza::ConstantNode.new(1)

      Cadenza::BooleanNode.new(variable, "==", constant).should_not == Cadenza::BooleanNode.new(variable, "!=", constant)
   end

   it "should not equal a node with a different left side" do
      variable_a = Cadenza::VariableNode.new("x")
      variable_b = Cadenza::VariableNode.new("y")
      constant   = Cadenza::ConstantNode.new(1)

      Cadenza::BooleanNode.new(variable_a, "==", constant).should_not == Cadenza::BooleanNode.new(variable_b, "==", constant)
   end

   it "should not equal a node with a different right side" do
      variable = Cadenza::VariableNode.new("x")
      constant_a = Cadenza::ConstantNode.new(1)
      constant_b = Cadenza::ConstantNode.new(2)

      Cadenza::BooleanNode.new(variable, "==", constant_a).should_not == Cadenza::BooleanNode.new(variable, "==", constant_b)
   end

   it "should use the union of it's left and right node's implied globals for it's own implied globals" do
      variable_a = Cadenza::VariableNode.new("a")
      variable_b = Cadenza::VariableNode.new("b")

      boolean_a = Cadenza::BooleanNode.new(variable_a, "==", variable_b)
      boolean_b = Cadenza::BooleanNode.new(variable_a, "==", variable_a)

      boolean_a.implied_globals.should == %w(a b)
      boolean_b.implied_globals.should == %w(a)
   end
end
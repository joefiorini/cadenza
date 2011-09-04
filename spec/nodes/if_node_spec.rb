require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::IfNode do
   it "should be equivalent to another node with the same expression and children" do
      text_a = Cadenza::TextNode.new("true")
      text_b = Cadenza::TextNode.new("false")

      var = Cadenza::VariableNode.new("bar")
      one = Cadenza::ConstantNode.new(1)
      expression = Cadenza::BooleanNode.new(var, "==", one)

      node_a = Cadenza::IfNode.new(expression, text_a, text_b)
      node_b = Cadenza::IfNode.new(expression, text_a, text_b)

      node_a.should == node_b
   end

   it "should not be equivalent to another node with a different expression" do
      text_a = Cadenza::TextNode.new("true")
      text_b = Cadenza::TextNode.new("false")

      var = Cadenza::VariableNode.new("bar")
      one = Cadenza::ConstantNode.new(1)
      two = Cadenza::ConstantNode.new(2)
      expression_a = Cadenza::BooleanNode.new(var, "==", one)
      expression_b = Cadenza::BooleanNode.new(var, "==", two)

      node_a = Cadenza::IfNode.new(expression_a, text_a, text_b)
      node_b = Cadenza::IfNode.new(expression_b, text_a, text_b)

      node_a.should_not == node_b
   end

   it "should not be equivalent to another node with different true children" do
      text_a = Cadenza::TextNode.new("true")
      text_b = Cadenza::TextNode.new("false")
      text_c = Cadenza::TextNode.new("foo")

      var = Cadenza::VariableNode.new("bar")
      one = Cadenza::ConstantNode.new(1)
      expression = Cadenza::BooleanNode.new(var, "==", one)

      node_a = Cadenza::IfNode.new(expression, text_a, text_b)
      node_b = Cadenza::IfNode.new(expression, text_c, text_b)

      node_a.should_not == node_b
   end

   it "should not be equivalent to another node with different false children" do
      text_a = Cadenza::TextNode.new("true")
      text_b = Cadenza::TextNode.new("false")
      text_c = Cadenza::TextNode.new("foo")

      var = Cadenza::VariableNode.new("bar")
      one = Cadenza::ConstantNode.new(1)
      expression = Cadenza::BooleanNode.new(var, "==", one)

      node_a = Cadenza::IfNode.new(expression, text_a, text_b)
      node_b = Cadenza::IfNode.new(expression, text_a, text_c)

      node_a.should_not == node_b
   end

   it "should assign an empty array to the children if not defined" do
      var = Cadenza::VariableNode.new("bar")
      one = Cadenza::ConstantNode.new(1)
      expression = Cadenza::BooleanNode.new(var, "==", one)
      
      node = Cadenza::IfNode.new(expression)

      node.true_children.should == []
      node.false_children.should == []
   end
end
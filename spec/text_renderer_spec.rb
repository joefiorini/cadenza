require 'spec_helper'
require 'stringio'

describe Cadenza::TextRenderer do
   let(:output)   { StringIO.new }
   let(:renderer) { Cadenza::TextRenderer.new(output) }
   let(:context)  { Cadenza::Context.new(:pi => 3.14159) }
   let(:document) { Cadenza::DocumentNode.new }

   # some sample constant and variable nodes
   let(:pi)  { Cadenza::VariableNode.new("pi") }
   let(:one) { Cadenza::ConstantNode.new(1) }
   
   let(:true_boolean_expression) { Cadenza::BooleanNode.new pi, ">", one }
   let(:false_boolean_expression) { Cadenza::BooleanNode.new pi, "<", one }

   it "should render a text node's content" do
      document.children.push Cadenza::TextNode.new "foo"

      renderer.render(document, context)

      renderer.output.string.should == "foo"
   end

   it "should render a constant node's string value" do
      document.children.push Cadenza::ConstantNode.new 3.14159

      renderer.render(document, context)

      renderer.output.string.should == "3.14159"
   end

   it "should render a variable node's value based on the value in the context" do
      document.children.push(pi)

      renderer.render(document, context)

      renderer.output.string.should == "3.14159"
   end

   it "should render the stringified result of an arithmetic node's value" do
      document.children.push Cadenza::ArithmeticNode.new pi, "+", one

      renderer.render(document, context)

      renderer.output.string.should == "4.14159"
   end

   it "should render the stringified result of a boolean node's value" do
      document.children.push true_boolean_expression

      renderer.render(document, context)

      renderer.output.string.should == "true"
   end

   it "should render the appropriate block of the if node" do
      yup = Cadenza::TextNode.new "yup"
      nope = Cadenza::TextNode.new "nope"

      document.children.push Cadenza::IfNode.new(true_boolean_expression, [yup], [nope])

      renderer.render(document, context)

      renderer.output.string.should == "yup"
   end
end
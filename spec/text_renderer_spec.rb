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

   it "should render the value of a inject node to the output" do
      pi = Cadenza::VariableNode.new("pi")

      floor = Cadenza::FilterNode.new("floor")
      add_one = Cadenza::FilterNode.new("add", [Cadenza::ConstantNode.new(1)])

      context = Cadenza::Context.new({:pi => 3.14159}, {
         :floor => Proc.new {|value| value.floor },
         :add =>   Proc.new {|value, amount| value + amount }
      })

      document.children.push Cadenza::InjectNode.new(pi, [floor, add_one])

      renderer.render(document, context)

      renderer.output.string.should == "4"
   end

   it "should render a for block's children the specified number of times" do
      iterable = Cadenza::VariableNode.new("alphabet")
      iterator = Cadenza::VariableNode.new("x")
      counter  = Cadenza::VariableNode.new("counter")

      children = [Cadenza::InjectNode.new(counter), Cadenza::TextNode.new(": "), Cadenza::InjectNode.new(iterator), Cadenza::TextNode.new("\n")]

      context = Cadenza::Context.new({:alphabet => %w(a b c)})

      document.children.push Cadenza::ForNode.new(iterator, iterable, children)

      renderer.render(document, context)

      renderer.output.string.should == "1: a\n2: b\n3: c\n"
   end
end
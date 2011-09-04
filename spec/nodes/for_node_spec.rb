require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::ForNode do
   it "should be equal to another node with the same iterator, iterable and children" do
      text = Cadenza::TextNode.new("foo")
      iterator = Cadenza::VariableNode.new("i")
      iterable = Cadenza::VariableNode.new("elements")

      for_a = Cadenza::ForNode.new(iterator, iterable, [text])
      for_b = Cadenza::ForNode.new(iterator, iterable, [text])

      for_a.should == for_b
   end

   it "should not equal another node with a different iterator" do
      text = Cadenza::TextNode.new("foo")
      iterator_a = Cadenza::VariableNode.new("i")
      iterator_b = Cadenza::VariableNode.new("x")
      iterable = Cadenza::VariableNode.new("elements")

      for_a = Cadenza::ForNode.new(iterator_a, iterable, [text])
      for_b = Cadenza::ForNode.new(iterator_b, iterable, [text])

      for_a.should_not == for_b
   end

   it 'should not equal another node with a different iterable' do
      text = Cadenza::TextNode.new("foo")
      iterator = Cadenza::VariableNode.new("i")
      iterable_a = Cadenza::VariableNode.new("elements")
      iterable_b = Cadenza::VariableNode.new("array")

      for_a = Cadenza::ForNode.new(iterator, iterable_a, [text])
      for_b = Cadenza::ForNode.new(iterator, iterable_b, [text])

      for_a.should_not == for_b
   end

   it 'should not equal another node with different children' do
      text_a = Cadenza::TextNode.new("foo")
      text_b = Cadenza::TextNode.new("bar")
      iterator = Cadenza::VariableNode.new("i")
      iterable = Cadenza::VariableNode.new("elements")

      for_a = Cadenza::ForNode.new(iterator, iterable, [text_a])
      for_b = Cadenza::ForNode.new(iterator, iterable, [text_b])

      for_a.should_not == for_b
   end
end
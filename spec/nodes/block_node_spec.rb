require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::BlockNode do
  it "should be equivalent to a block with the same name and children" do
    text = Cadenza::TextNode.new("bar")

    block_a = Cadenza::BlockNode.new("foo", text)
    block_b = Cadenza::BlockNode.new("foo", text)

    block_a.should == block_b
  end

  it "should not be equivalent to a block with a different name" do
    text = Cadenza::TextNode.new("bar")

    block_a = Cadenza::BlockNode.new("foo", text)
    block_b = Cadenza::BlockNode.new("bar", text)

    block_a.should_not == block_b
  end

  it "should not be equivalent to a block with different children" do
    text_a = Cadenza::TextNode.new("bar")
    text_b = Cadenza::TextNode.new("baz")

    block_a = Cadenza::BlockNode.new("foo", text_a)
    block_b = Cadenza::BlockNode.new("foo", text_b)

    block_a.should_not == block_b
  end
end
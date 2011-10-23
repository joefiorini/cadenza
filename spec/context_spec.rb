require 'spec_helper'
require 'ostruct'

describe Cadenza::Context do

   it "should start with an empty stack" do
      Cadenza::Context.new.stack.should == [{}]
   end

   it "should take a hash and define that as the stack's first element" do
      Cadenza::Context.new(:foo => "bar").stack.should == [{:foo => "bar"}]
   end

   it "should retrieve the value of an identifier" do
      Cadenza::Context.new(:foo => "bar").lookup("foo").should == "bar"
   end

   it "should retrieve the value of an identifier with dot notation" do
      Cadenza::Context.new(:foo => {:bar => "baz"}).lookup("foo.bar").should == "baz"
   end

   it "should allow pushing new values onto the stack" do
      context = Cadenza::Context.new(:foo => "bar")
      context.push(:baz => "foo")

      context.stack.should == [{:foo => "bar"}, {:baz => "foo"}]
   end

   it "should retrieve the value of an identifier in a higher scope" do
      context = Cadenza::Context.new(:foo => "bar")
      context.push(:baz => "foo")

      context.lookup("baz").should == "foo"
   end

   it "should retreive the overriden value of an identifier in a higher scope" do
      context = Cadenza::Context.new(:foo => "bar")
      context.push(:foo => "baz")

      context.lookup("foo").should == "baz"
   end

   it "should allow popping the top scope off the stack" do
      context = Cadenza::Context.new(:foo => "bar")
      context.push(:foo => "baz")

      context.lookup("foo").should == "baz"

      context.pop

      context.lookup("foo").should == "bar"
   end

   it "should look up identifiers on an object if the object responds to that identifier" do
      context = Cadenza::Context.new(:foo => OpenStruct.new(:bar => "baz"))

      context.lookup("foo.bar").should == "baz"
   end

   it "should look up array indexes" do
      Cadenza::Context.new(:alphabet => %w(a b c)).lookup("alphabet.1").should == "b"
   end
end
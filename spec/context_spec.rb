require 'spec_helper'

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
end
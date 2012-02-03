require 'spec_helper'
require 'ostruct'

describe Cadenza::Context do
   it "should start with an empty stack" do
      Cadenza::Context.new.stack.should == [{}]
   end

   it "should start with an empty filter map" do
      Cadenza::Context.new.filters.should be_empty
   end

   it "should start with an empty statement map" do
      Cadenza::Context.new.statements.should be_empty
   end

   it "should take a hash and define that as the stack's first element" do
      Cadenza::Context.new(:foo => "bar").stack.should == [{:foo => "bar"}]
   end

   it "should allow pushing new values onto the stack" do
      context = Cadenza::Context.new(:foo => "bar")
      context.push(:baz => "foo")

      context.stack.should == [{:foo => "bar"}, {:baz => "foo"}]
   end

   context "#lookup" do
      let(:context) do
         Cadenza::Context.new({
            :foo => {:bar => "baz"}, 
            :abc => OpenStruct.new(:def => "ghi"), 
            :alphabet => %w(a b c)
         })
      end

      it "should retrieve the value of an identifier" do
         context.lookup("foo").should == {:bar => "baz"}
      end

      it "should retrieve the value of an identifier with dot notation" do
         context.lookup("foo.bar").should == "baz"
      end

      it "should retrieve the value of an identifier in a higher scope" do
         context.push(:baz => "foo")
         context.lookup("baz").should == "foo"
      end

      it "should retreive the overriden value of an identifier in a higher scope" do
         context.push(:foo => "baz")
         context.lookup("foo").should == "baz"
      end

      it "should allow popping the top scope off the stack" do
         context.push(:foo => "baz")

         context.lookup("foo").should == "baz"

         context.pop

         context.lookup("foo").should == {:bar => "baz"}
      end

      it "should look up identifiers on an object if the object responds to that identifier" do
         context.lookup("abc.def").should == "ghi"
      end

      it "should look up array indexes" do
         context.lookup("alphabet.1").should == "b"
      end
   end

   context "#assign" do
      let(:context) { Cadenza::Context.new }

      it "should assign a value to the current stack" do
         context.lookup("foo").should be_nil

         lambda { context.assign(:foo, "bar") }.should_not change(context.stack, :length)

         context.lookup("foo").should == "bar"
      end
   end

   context "#define_filter" do
      let(:context) { Cadenza::Context.new }

      before do
         context.define_filter(:pluralize) {|input| "#{input}s" }
      end

      it "should allow defining a filter method" do
         context.filters[:pluralize].should be_a(Proc)
      end

      it "should evaluate a filter" do         
         context.evaluate_filter(:pluralize, "bar").should == "bars"
      end
   end

   context "#define_statement" do
      let(:context) { Cadenza::Context.new }

      before do
         context.define_statement(:assign) {|context, name, value| context.assign(name, value) }
      end

      it "should allow defining a statement method" do
         context.statements[:assign].should be_a(Proc)
      end

      it "should evaluate a statement" do
         context.lookup("foo").should be_nil
         
         context.evaluate_statement(:assign, ["foo", 123])

         context.lookup("foo").should == 123
      end
   end
end
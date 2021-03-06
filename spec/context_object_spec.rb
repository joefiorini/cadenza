require 'spec_helper'

describe Cadenza::ContextObject do
   subject { TestContextObject.new }

   it "invokes public methods" do
      subject.send(:invoke_context_method, "public_visibility_method").should == 123
   end

   it "doesn't invoke private methods" do
      subject.send(:invoke_context_method, "private_visibility_method").should == nil
   end

   it "doesn't invoke protected methods" do
      subject.send(:invoke_context_method, "protected_visibility_method").should == nil
   end

   it "invokes before_method if defined" do
      subject.should_receive(:before_method).once
      subject.send(:invoke_context_method, "public_visibility_method")
   end

   it "invokes after_method if defined" do
      subject.should_receive(:after_method).once
      subject.send(:invoke_context_method, "public_visibility_method")
   end

   it "invokes missing_context_method if trying to invoke a method which doesn't exist" do
      subject.should_receive(:missing_context_method).with("foo").once
      subject.send(:invoke_context_method, "foo")
   end

   context "#context_methods" do
      it "returns only the public methods defined on it, not public methods of Object" do
         subject.send(:context_methods).should == %w(public_visibility_method)
      end
   end
end
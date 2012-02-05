require 'spec_helper'

describe Cadenza do
   it "should define a base context" do
      Cadenza::BaseContext.should be_a Cadenza::Context
   end
end
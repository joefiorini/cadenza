require 'spec_helper'

describe Cadenza::BaseContext, 'standard filters' do
   subject { Cadenza::BaseContext }

   context "addslashes" do
      it "should replace slashes with double slashes" do
         subject.evaluate_filter(:addslashes, ["foo\\bar"]).should == "foo\\\\bar"
      end

      it "should escape single quotes" do
         subject.evaluate_filter(:addslashes, ["I'm here"]).should == "I\\'m here"
      end

      it "should escape double quotes" do
         subject.evaluate_filter(:addslashes, ["he said \"hello world!\""]).should == 'he said \\"hello world!\\"'
      end
   end

   it "should define the capitalize filter" do
      subject.evaluate_filter(:capitalize, ["foo"]).should == "Foo"
   end

   context "center" do
      it "should center the text with spaces" do
         subject.evaluate_filter(:center, ["foo", 9]).should == "   foo   "
      end

      it "should have an optional argument for the padding character" do
         subject.evaluate_filter(:center, ["foo", 9, "x"]).should == "xxxfooxxx"
      end
   end

   context "cut" do
      it "should remove the string from the string" do
         subject.evaluate_filter(:cut, ["abcdefghi", "def"]).should == "abcghi"
      end
   end

   context "date" do
      let(:time) { Time.at(0) }
      it "should format the date using sprintf notation" do
         subject.evaluate_filter(:date, [time]).should == "1969-12-31"
      end

      it "should allow passing a custom string fomrmatting time" do
         subject.evaluate_filter(:date, [time, "%F %R"]).should == "1969-12-31 19:00"
      end
   end
end

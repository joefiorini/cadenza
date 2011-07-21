require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::Parser, "arithmetic parsing" do
  let(:parser) { Cadenza::Parser.new }

  it "should parse a additive expression" do
    parser.parse("{{ x + 1 }}").should have_an_identical_syntax_tree_to "additive_expression.parse.yml"
  end

end
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::Parser, 'constant nodes' do
  let(:parser) { Cadenza::Parser.new(:lexer => FixtureLexer.new) }

  it "should parse a integer token into a constant node" do
    parser.parse("integer.lex.yml").should have_an_identical_syntax_tree_to "integer.parse.yml"
  end

end
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::Parser, 'variable nodes' do
  let(:parser) { Cadenza::Parser.new(:lexer => FixtureLexer.new) }

  it "should parse a identifier token into a variable node" do
    parser.parse("variable.lex.yml").should have_an_identical_syntax_tree_to "variable.parse.yml"
  end

end
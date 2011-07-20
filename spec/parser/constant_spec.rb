require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadenza::Parser, 'constant nodes' do
  let(:parser) { Cadenza::Parser.new(:lexer => FixtureLexer.new) }

  it "should parse a integer token into a constant node" do
    pending "need some good testing facilities for abstract syntax trees"
    ast = parser.parse "integer.lex.yml"

    ast.length.should == 1
    ast.first.children.length.should == 1
    ast.first.children.first.should be_an_instance_of Cadenza::ConstantNode
    ast.first.children.first.value.should == 42
  end

end
require 'yaml'

class FixtureSyntaxTree
  attr_reader :document
  
  def initialize(filename)
    @document = parse_fixture("DocumentNode", YAML.load_file(fixture_filename filename)["DocumentNode"])
  end

  def equals(document)
    @document == document
  end

private
  def parse_fixture(type, node)
    case type
      when "DocumentNode" then parse_document_node(node)
      when "ConstantNode" then parse_constant_node(node)
      when "InjectNode"   then parse_inject_node(node)
      when "VariableNode" then parse_variable_node(node)
      else raise "unknown type: #{type}"
    end
  end

  def parse_document_node(node)
    parsed_node = Cadenza::DocumentNode.new

    parsed_node.children = node["children"].map do |child|
      type = child.keys.first
      node = child[type]
      parse_fixture(type, node)
    end

    parsed_node
  end

  def parse_constant_node(node)
    Cadenza::ConstantNode.new(node["value"])
  end

  def parse_inject_node(node)
    value_type = node["value"].keys.first
    value_node = node["value"][value_type]
    
    Cadenza::InjectNode.new(parse_fixture(value_type, value_node))
  end

  def parse_variable_node(node)
    Cadenza::VariableNode.new(node["value"])
  end

end
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
      when "ArithmeticNode" then parse_arithmetic_node(node)
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

    filters = (node["filters"] || []).map do |filter_def|
      identifier = filter_def["identifier"]

      parameters = (filter_def["parameters"] || []).map do |param_def|
        type = param_def.keys.first
        node = param_def[type]

        parse_fixture(type, node)
      end

      Cadenza::FilterNode.new(identifier, parameters)
    end
    
    Cadenza::InjectNode.new(parse_fixture(value_type, value_node), filters)
  end

  def parse_variable_node(node)
    Cadenza::VariableNode.new(node["value"])
  end

  def parse_arithmetic_node(node)
    left_type = node["left"].keys.first
    left_node = parse_fixture(left_type, node["left"][left_type])

    right_type = node["right"].keys.first
    right_node = parse_fixture(right_type, node["right"][right_type])

    Cadenza::ArithmeticNode.new(left_node, node["operator"], right_node)
  end

end
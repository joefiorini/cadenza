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
      when "FilterNode" then parse_filter_node(node)
      when "VariableNode" then parse_variable_node(node)
      when "ArithmeticNode" then parse_arithmetic_node(node)
      when "BooleanNode" then parse_boolean_node(node)
      when "TextNode" then parse_text_node(node)
      when "IfNode" then parse_if_node(node)
      when "ForNode" then parse_for_node(node)
      when "BlockNode" then parse_block_node(node)
      when "RenderNode" then parse_render_node(node)
      when "GenericStatementNode" then parse_generic_statement_node(node)
      else raise "unknown type: #{type}"
    end
  end

  def parse_document_node(node)
    parsed_node = Cadenza::DocumentNode.new
    parsed_node.children = list_for_key(node, "children")

    if node.has_key?("extends")
      parsed_node.extends = node["extends"].is_a?(String) ? node["extends"] : node_for_key(node, "extends")
    end

    if node.has_key?("blocks")
      parsed_node.blocks = hash_for_key(node, "blocks")
    end
    
    parsed_node
  end

  def parse_constant_node(node)
    Cadenza::ConstantNode.new(node["value"])
  end

  def parse_inject_node(node)
    value = node_for_key(node, "value")
    filters = list_for_key(node, "filters")
    
    Cadenza::InjectNode.new(value, filters)
  end

  def parse_filter_node(node)
    identifier = node["identifier"]
    parameters = list_for_key(node, "parameters")
    
    Cadenza::FilterNode.new(identifier, parameters)
  end

  def parse_variable_node(node)
    Cadenza::VariableNode.new(node["value"])
  end

  def parse_boolean_node(node)
    left = node_for_key(node, "left")
    right = node_for_key(node, "right")

    Cadenza::BooleanNode.new(left, node["operator"], right)
  end

  def parse_arithmetic_node(node)
    left = node_for_key(node, "left")
    right = node_for_key(node, "right")

    Cadenza::ArithmeticNode.new(left, node["operator"], right)
  end

  def parse_text_node(node)
    Cadenza::TextNode.new(node["text"])
  end

  def parse_if_node(node)
    expression     = node_for_key(node, "expression")
    true_children  = list_for_key(node, "true_children")
    false_children = list_for_key(node, "false_children")

    Cadenza::IfNode.new(expression, true_children, false_children)
  end

  def parse_for_node(node)
    iterator = node_for_key(node, "iterator")
    iterable = node_for_key(node, "iterable")
    children = list_for_key(node, "children")

    Cadenza::ForNode.new(iterator, iterable, children)
  end

  def parse_block_node(node)
    name     = node["name"]
    children = list_for_key(node, "children")

    Cadenza::BlockNode.new(name, children)
  end

  def parse_render_node(node)
    filename = node["filename"].is_a?(String) ? node["filename"] : node_for_key(node, "filename")

    Cadenza::RenderNode.new(filename)
  end

  def parse_generic_statement_node(node)
    name = node["name"]
    parameters = node.has_key?("parameters") ? list_for_key(node, "parameters") : []

    Cadenza::GenericStatementNode.new(name, parameters)
  end

private
  def node_for_key(node, key)
    type = node[key].keys.first
    parse_fixture(type, node[key][type])
  end

  def hash_for_key(node, key)
    result = {}
    parent = node[key]

    parent.keys.each do |name|
      result[name] = node_for_key(parent, name)
    end

    result
  end

  def list_for_key(node, key)
    (node[key] || []).map do |child|
      type = child.keys.first
      inner_node = child[type]
      parse_fixture(type, inner_node)
    end
  end

end
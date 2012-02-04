require File.expand_path(File.join("..", "lib", "cadenza"), File.dirname(__FILE__))
require 'nokogiri/diff'

Dir.glob(File.expand_path(File.join('support','*.rb'), File.dirname(__FILE__))).each do |support_file|
  require support_file
end

def fixture_filename(filename)
  File.expand_path(File.join("fixtures", filename), File.dirname(__FILE__))
end

def fixture_file_handle(filename)
   File.open(fixture_filename filename)
end

RSpec::Matchers.define :have_an_identical_syntax_tree_to do |expected|
  match do |actual|
    @tree = FixtureSyntaxTree.new(expected)
    @tree.equals(actual)
  end

  failure_message_for_should do |actual|
    "expected that #{actual.inspect} would have an identical syntax tree to #{@tree.document.inspect}"
  end
end

RSpec::Matchers.define :be_html_equivalent_to do |expected|
  match do |actual|
    expected_doc = Nokogiri::HTML(expected)
    actual_doc   = Nokogiri::HTML(actual)

    full_diff = expected_doc.diff(actual_doc)

    # reject any diffs which have no change or are text nodes containing only whitespace
    @diff = full_diff.reject do |change, node|
      change == " " or (node.text? and node.to_html =~ /^\s*$/)
    end

    @diff.empty?
  end

  failure_message_for_should do |actual|
    result = ""

    @diff.each do |change, node|
      result << node.path << "\n"
      result << change << " " << node.to_html.inspect << "\n"
      result << "\n"
    end

    result
  end
end
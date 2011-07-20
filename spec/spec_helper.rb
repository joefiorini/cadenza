require File.expand_path(File.join("..", "lib", "cadenza"), File.dirname(__FILE__))
require 'yaml'

def fixture_filename(filename)
  File.expand_path(File.join("fixtures", filename), File.dirname(__FILE__))
end

class FixtureLexer
  def source=(source)
    @data = YAML.load_file(fixture_filename source) || []
  end

  def next_token
    if @data.nil? or @data.empty?
      [false, false]
    else
      make_token(@data.shift)
    end
  end

private
  def make_token(yaml)
    type = yaml["type"].to_sym
    value = yaml["value"]
    source = yaml["value"].to_s
    line = yaml["line"]
    column = yaml["column"]

    [type, Cadenza::Token.new(value, source, line, column)]
  end
end
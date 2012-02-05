
require 'cadenza/token'
require 'cadenza/lexer'
require 'cadenza/parser'
require 'cadenza/context'
require 'cadenza/base_renderer'
require 'cadenza/text_renderer'
require 'cadenza/filesystem_loader'
require 'cadenza/version'

# require all nodes
Dir[File.join File.dirname(__FILE__), 'cadenza', 'nodes', '*.rb'].each {|f| require f }

module Cadenza
   BaseContext = Context.new
end
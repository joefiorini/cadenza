module Cadenza
  class DocumentNode
    attr_accessor :extends
    attr_accessor :children
    # attr_accessor :blocks
    
    def initialize
      @children = []
    end

    def ==(rhs)
      @children == rhs.children and
      @extends == rhs.extends
    end
    
#     #
#     # Gets a list of all identifiers from the document's blocks and children
#     # which are not locally defined.
#     #
#     # TODO: the extended document must also be included in this list
#     #
#     def implied_globals
#       children.map(&:implied_globals).flatten | blocks.values.map(&:implied_globals).flatten 
#     end
#
#     def render(context={}, stream='', overriding_blocks=Hash.new)
#
#       overriding_blocks.each do | name, block |
#         local = self.blocks.fetch(name) rescue next
#         local.overridden_by = block
#         block.overrides = local
#       end
#
#       if self.extends.nil?
#         # There is no base document, render the document as normal
#         self.children.each { |child| child.render(context,stream) }
#         return stream
#       else
#         extends_template = Loader.get_template('Filesystem', self.extends.eval(context))
#         return extends_template.render(context, stream, self.blocks)
#       end
#     end
  end
end
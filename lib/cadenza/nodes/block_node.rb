module Cadenza
#   class BlockNodeProxy < Struct.new(:context, :stream, :overrides)
#     def super
#       return overrides.render(context,stream,true) unless overrides.nil?
#     end
#   end
  
   class BlockNode
      attr_accessor :name, :children
#     attr_accessor :overrides, :overridden_by

      def initialize(name, children)
         @name = name
         @children = children
      end

#     def implied_globals
#       children.map(&:implied_globals).flatten
#     end
    
#     def render(context={}, stream='', is_super_call=false)
#       unless is_super_call or self.overridden_by.nil?
#         return self.overridden_by.render(context,stream)
#       end
      
#       inner_context = context.clone
#       inner_context.store('block', BlockNodeProxy.new(context, stream, overrides))
      
#       self.children.each { |child| child.render(inner_context,stream) }
#     end

      def ==(rhs)
         @name == rhs.name and
         @children == rhs.children
      end
  end
end
module Cadenza
   class RenderNode
      attr_accessor :filename
      
      def initialize(filename)
         @filename = filename
      end

      def implied_globals
         @filename.is_a?(VariableNode) ? @filename.implied_globals : []
      end
    
#     def render(context={}, stream='')
#       template = Loader.get_template('Filesystem', self.filename.eval(context))
      
#       if self.locals.nil?
#         new_context = context.clone
#       else
#         new_context = Hash.new
#         self.locals.each { |k,v| new_context.store(k.eval(context), v.eval(context)) }
#       end
      
#       return template.render(new_context, stream)
#     end

      def ==(rhs)
         @filename == rhs.filename
      end
   end
end
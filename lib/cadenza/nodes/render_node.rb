module Cadenza
   class RenderNode #< Node
      attr_accessor :filename
      
      def initialize(filename)
         @filename = filename
      end
    
#     #
#     # Returns an empty list (for now).  In the future this will return all
#     # implied globals of the resolved template.
#     #
#     def implied_globals
#       []
#     end
    
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
    
#     def to_s
#       "RenderNode" << TAB << "Filename: #{self.filename}" << TAB << "Locals: #{self.locals.inspect}"
#     end
    
   end
end
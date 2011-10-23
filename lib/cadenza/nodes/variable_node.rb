module Cadenza  
   class VariableNode
      attr_accessor :identifier

      def initialize(identifier)
         self.identifier = identifier
      end

      def implied_globals
         [self.identifier]
      end
    
#     def render(context={}, stream='')
#       stream << self.eval(context).to_s
#     end
    
#     def eval(context)
#       # if the identifier has any number of dots in it we want to split it 
#       if not self.identifier.index('.').nil?
#         return eval_variable_path(context)
#       else
#         unless context.has_key?(self.identifier)
#           raise TemplateError.new("variable #{self.identifier} is not defined", self)
#         end
        
#         return context[self.identifier]
#       end
#     end

      def ==(rhs)
         self.identifier == rhs.identifier
      end
  end
end
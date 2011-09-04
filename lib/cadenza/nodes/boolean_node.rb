module Cadenza
  class BooleanNode
      attr_accessor :left, :right, :operator

      def initialize(left, operator, right)
         @left = left
         @right = right
         @operator = operator
      end
          
#     def implied_globals
#       left.implied_globals | right.implied_globals
#     end
    
#     def render(context={}, stream='')
#       stream << self.eval(context).to_s
#     end
    
#     def eval(context)
#       l = self.left.eval(context)
#       r = self.right.eval(context)
      
#       case self.op
#         when '=='
#           return l == r
          
#         when '!='
#           return l != r
          
#         when '>='
#           return l >= r
          
#         when '<='
#           return l <= r
          
#         when '>'
#           return l > r
        
#         when '<'
#           return l < r
#       end
#     end

      def ==(rhs)
         @operator == rhs.operator and
         @left == rhs.left and
         @right == rhs.right
      end
  end
end
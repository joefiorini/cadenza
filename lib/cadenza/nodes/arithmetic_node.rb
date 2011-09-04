module Cadenza
  class ArithmeticNode
    attr_accessor :left, :right, :operator

    def initialize(left, op, right)
      self.left = left
      self.right = right
      self.operator = op
    end

    def ==(rhs)
      self.operator == rhs.operator and
      self.left == rhs.left and
      self.right == rhs.right
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
#         when '+'
#           return l + r
          
#         when '-'
#           return l - r
          
#         when '*'
#           return l * r
          
#         when '/'
#           raise TemplateError('division by zero',self) if r == 0
#           return l / r
#       end
#     end
  end
end
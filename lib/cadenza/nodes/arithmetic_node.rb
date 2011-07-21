module Cadenza
  class ArithmeticNode# < Cadenza::Node
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
    
#     def initialize(left,right,op,pos)
#       super(pos)
      
#       self.left = left
#       self.right = right
#       self.op = op
#     end
    
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
    
#     def ==(rhs)
#       super(rhs) and
#       self.left == rhs.left and
#       self.right == rhs.right and
#       self.op == rhs.op
#     end
    
#     def to_s
#       "ArithmeticNode" << TAB << self.left.to_s.gsub(/\n/,TAB) << TAB << self.op << TAB << self.right.to_s.gsub(/\n/,TAB)
#     end
  end
end
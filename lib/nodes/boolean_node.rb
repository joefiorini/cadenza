module Cadenza
  class BooleanNode < Cadenza::Node
    attr_accessor :left, :right, :op
    
    def initialize(left,right,op,line,col)
      super(line,col)
      
      self.left = left
      self.right = right
      self.op = op
    end
    
    def render(context,stream)
      stream << self.eval(context).to_s
    end
    
    def eval(context)
      l = self.left.eval(context)
      r = self.right.eval(context)
      
      case self.op
        when '=='
          return l == r
          
        when '!='
          return l != r
          
        when '>='
          return l >= r
          
        when '<='
          return l <= r
          
        when '>'
          return l > r
        
        when '<'
          return l < r
      end
    end
    
    def to_s
      "BooleanNode" << TAB << self.left.to_s.gsub(/\n/,TAB) << TAB << self.op << TAB << self.right.to_s.gsub(/\n/,TAB)
    end
  end
end
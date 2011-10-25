module Cadenza
  class IfNode
   attr_accessor :expression, :true_children, :false_children

   def initialize(expression, true_children=[], false_children=[])
      @expression = expression
      @true_children = true_children
      @false_children = false_children
   end

   def implied_globals
      (@expression.implied_globals + true_children.map(&:implied_globals).flatten + false_children.map(&:implied_globals).flatten).uniq
   end

   def evaluate_expression_for_children(context)
      value = @expression.eval(context)

      if value == true
         return @true_children

      elsif value == false
         return @false_children

      elsif value.is_a?(String)
         return value.length == 0 || value =~ /\s+/ ? @false_children : @true_children

      elsif value.is_a?(Float) or value.is_a?(Fixnum)
         return value == 0 ? @false_children : @true_children

      else
         return !!value ? @true_children : @false_children
         
      end
   end
    
#     def render(context={}, stream='')
#       #TODO: i want to raise legitimate exceptions here, but if a method was undefined i want to
#       # evaluate to false instead of raising an exception.  Example:
#       # {% if address.city %}
#       # a city was defined
#       # {% else %}
#       # a city was not defined
#       # {% endif %}
#       evaluation = self.expression.eval(context)
      
#       if evaluation
#         self.true_children.each  {|child| child.render(context, stream)}
#       elsif self.false_children
#         self.false_children.each {|child| child.render(context, stream)}
#       else
#         return ''        
#       end      
      
#       return stream
#     end

   def ==(rhs)
      @expression == rhs.expression and
      @true_children == rhs.true_children and
      @false_children == rhs.false_children
   end
  end
end
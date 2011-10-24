
module Cadenza
   class TextRenderer
      attr_reader :output

      def initialize(output_io)
         @output = output_io
      end

      def render(node, context)
         case node
            when DocumentNode
               node.children.each {|x| render(x, context) }
            when TextNode
               @output << node.text
            when ConstantNode
               @output << node.eval(context).to_s
            when VariableNode
               @output << node.eval(context).to_s
            when ArithmeticNode
               @output << node.eval(context).to_s
            when BooleanNode
               @output << node.eval(context).to_s
            when IfNode
               node.evaluate_expression_for_children(context).each {|x| render(x, context) }
         end
      end

   end
end

module Cadenza
   class TextRenderer
      attr_reader :output, :document

      def initialize(output_io)
         @output = output_io
      end

      def render(node, context)
         @document ||= node

         case node
            when DocumentNode
               node.children.each {|x| render(x, context) }

            when BlockNode
               node.children.each {|x| render(x, context) } unless document.extends

            when TextNode
               @output << node.text

            when InjectNode
               @output << node.evaluate(context).to_s

            when IfNode
               node.evaluate_expression_for_children(context).each {|x| render(x, context) }

            when GenericStatementNode
               params = node.parameters.map {|n| n.eval(context) }
               
               context.evaluate_statement(node.name, params)

            when ForNode
               enumerator = node.iterable.eval(context).to_enum
               iterator = node.iterator.identifier

               counter = 0
               loop do
                  # grab some values for the inner context
                  value = enumerator.next rescue break

                  is_first = (counter == 0)
                  is_last  = enumerator.peek rescue false ? true : false  #TODO: this doesn't work in 1.8.x

                  # push the inner context with the 'magic' variables
                  context.push({
                     iterator => value, 
                     'counter' => counter + 1, 
                     'counter0' => counter, 
                     'first' => is_first, 
                     'last' => is_last
                  })

                  # render each of the child nodes with the context
                  node.children.each {|x| render(x, context) }

                  # pop the inner context off
                  context.pop

                  # increment the counter
                  counter += 1
               end

            # none of these should appear directly inside the body of the 
            # document but for safety we will render them normally
            when ConstantNode, VariableNode, ArithmeticNode, BooleanNode
               @output << node.eval(context).to_s
         end
      end

   end
end
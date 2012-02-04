
module Cadenza
   class TextRenderer
      attr_reader :output, :document

      def initialize(output_io)
         @output = output_io
      end

      def render(node, context, blocks={})
         @document ||= node

         case node
            when DocumentNode
               if node.extends
                  # merge the inherited blocks onto this document's blocks to
                  # determine what to pass to the layout template
                  blocks = node.blocks.merge(blocks)

                  # load the template of the document and render it to the same output stream
                  template = context.load_template!(node.extends)

                  @document = template

                  render(template, context, blocks)
               else
                  node.children.each {|x| render(x, context, blocks) }
               end

            when RenderNode
               template = context.load_template(node.filename) || ""

               TextRenderer.new(@output).render(template, context)

            when BlockNode
               # block = blocks.detect {|b| b.name == node.name }
               block = blocks[node.name]

               (block || node).children.each {|x| render(x, context) }


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

      def underscore(camel_cased_word)
         word = camel_cased_word.to_s.dup
         word.gsub!(/::/, '/')
         word.gsub!(/(?:([A-Za-z\d])|^)(#{inflections.acronym_regex})(?=\b|[^a-z])/) { "#{$1}#{$1 && '_'}#{$2.downcase}" }
         word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
         word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
         word.tr!("-", "_")
         word.downcase!
         word
       end

   end
end
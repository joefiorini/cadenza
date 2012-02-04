
module Cadenza
   class TextRenderer
      attr_reader :output, :document

      def initialize(output_io)
         @output = output_io
      end
      
      def render(node, context, blocks={})
         @document ||= node

         node_name = underscore(node.class.name.split("::").last)

         send("render_#{node_name}", node, context, blocks)
      end

      # very consise form of ActiveSupport's underscore method
      def underscore(word)
         word.gsub!(/([a-z\d])([A-Z])/,'\1_\2').downcase!
      end

      def render_document_node(node, context, blocks)
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
      end

      def render_render_node(node, context, blocks)
         template = context.load_template(node.filename) || ""

         TextRenderer.new(@output).render(template, context)
      end

      def render_block_node(node, context, blocks)
         (blocks[node.name] || node).children.each {|x| render(x, context) }
      end

      def render_text_node(node, context, blocks)
         @output << node.text
      end

      def render_inject_node(node, context, blocks)
         @output << node.evaluate(context).to_s
      end

      def render_if_node(node, context, blocks)
         node.evaluate_expression_for_children(context).each {|x| render(x, context) }
      end

      def render_generic_statement_node(node, context, blocks)
         params = node.parameters.map {|n| n.eval(context) }
         
         context.evaluate_statement(node.name, params)
      end

      def render_for_node(node, context, blocks)
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
      end

      # none of these should appear directly inside the body of the 
      # document but for safety we will render them anyways
      def render_constant_node(node, context, blocks)
         @output << node.eval(context).to_s
      end

      alias :render_variable_node   :render_constant_node
      alias :render_arithmetic_node :render_constant_node
      alias :render_boolean_node    :render_constant_node

   end
end
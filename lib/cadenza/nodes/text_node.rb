 module Cadenza
   class TextNode
      attr_accessor :text

      def initialize(text)
         @text = text
      end    

#     def implied_globals
#       []
#     end
    
#     def render(context={}, stream='')
#       stream << self.text
#     end
    
      def ==(rhs)
         @text == rhs.text
      end
   end
 end
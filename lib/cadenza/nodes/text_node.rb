 module Cadenza
   class TextNode #< Cadenza::Node
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
    
#     def to_s
#       "TextNode(text: #{self.text})"
#     end
   end
 end
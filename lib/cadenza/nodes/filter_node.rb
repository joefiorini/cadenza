
module Cadenza
   class FilterNode
      attr_accessor :identifier, :parameters

      def initialize(identifier, parameters=[])
         @identifier = identifier
         @parameters = parameters
      end
   end
end
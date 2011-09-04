
module Cadenza
   class FilterNode
      attr_accessor :identifier, :parameters

      def initialize(identifier, parameters=[])
         @identifier = identifier
         @parameters = parameters
      end

      def implied_globals
         @parameters.map(&:implied_globals).flatten.uniq
      end
   end
end

module Cadenza

   class Context
      attr_accessor :stack

      def initialize(context={})
         @stack = [context]
      end

      def lookup(identifier)
         if identifier.index('.')
            lookup_path(@stack.first, identifier.split("."))
         else
            lookup_on_scope(@stack.first, identifier)
         end
      end

   private
      def lookup_path(scope, path)
         loop do
            component = path.shift

            scope = lookup_on_scope(scope, component)

            return scope if path.empty?
         end
      end

      def lookup_on_scope(scope, identifier)
         scope[identifier] || scope[identifier.to_sym]
      end

   end

end
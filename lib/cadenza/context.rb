
module Cadenza

   class Context
      attr_accessor :stack

      def initialize(initial_scope={})
         @stack = []

         push initial_scope
      end

      def lookup(identifier)
         @stack.reverse_each do |scope|
            value = lookup_identifier(scope, identifier)

            return value unless value.nil?
         end
         
         nil
      end

      # TODO: symbolizing strings is slow so consider symbolizing here to improve
      # the speed of the lookup method (its more important than push)
      def push(scope)
         @stack.push(scope)
      end

      def pop
         @stack.pop
      end

   private
      def lookup_identifier(scope, identifier)
         if identifier.index('.')
            lookup_path(scope, identifier.split("."))
         else
            lookup_on_scope(scope, identifier)
         end
      end

      def lookup_path(scope, path)
         loop do
            component = path.shift

            scope = lookup_on_scope(scope, component)

            return scope if path.empty?
         end
      end

      def lookup_on_scope(scope, identifier)
         sym_identifier = identifier.to_sym

         # if the identifier is a callable method then call that
         return scope.send(sym_identifier) if scope.respond_to?(sym_identifier)

         # allow looking up array indexes with dot notation, example: alphabet.0 => "a"
         if scope.respond_to?(:[]) and scope.is_a?(Array) and identifier =~ /\d+/
            return scope[identifier.to_i]
         end

         # otherwise assume it is a hash and look up the string and symbolized key
         if scope.respond_to?(:[])
            return scope[identifier] || scope[sym_identifier]
         end

         nil
      end

   end

end
module Cadenza
  class ForNode < Cadenza::Node
    attr_accessor :iterator, :iterable, :children
    
    def initialize(iterator, iterable, pos)
      super(pos)
      self.iterator = iterator
      self.iterable = iterable
      self.children = Array.new
    end
    
    def render(context, stream)
      current_iterator = self.iterable.eval(context)
      
      counter = 0
      current_iterator.each do | value |
        inner_context = context.clone
        inner_context.store(self.iterator.identifier, value)
        
        #TODO: store forloop variables in inner_context
        first = (counter == 0)
        last  = (counter == current_iterator.length - 1)
        inner_context.store('forloop',{'counter'=>counter+1, 'counter0'=>counter, 'first'=>first, 'last'=>last})
        
        self.children.each {|child| child.render(inner_context, stream)}
        
        counter += 1
      end
      
      return stream
    end
    
    def ==(rhs)
      super(rhs) and
      self.iterator == rhs.iterator and
      self.iterable == rhs.iterable and
      self.children == rhs.children
    end
    
    def to_s
      value = "ForNode(iterator: #{self.iterator}, iterable: #{self.iterable})" << TAB
      self.children.each { |child| value << child.to_s.gsub(/\n/,TAB) << TAB }
      return value.rstrip
    end
    
  end
end
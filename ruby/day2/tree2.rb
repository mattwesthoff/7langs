class Tree2
    attr_accessor :children, :node_name
    
    def initialize(data={})
        raise ArgumentError, "tree data cannot have multiple roots" if data.length > 1
        
        #{}.take(1)[0] = nil, so this is safe
        @node_name, child_hash = data.take(1)[0]
        
        @children = []
        child_hash.each do |k,v|
            @children.push Tree2.new({k => v})
        end
    end
    
    def load_from_array(name, children)
        @children = children
        @node_name = name
    end 
    
    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all(&block) }
    end
    
    def visit(&block)
        block.call self
    end
end


tree = Tree2.new({'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})
tree.visit_all {|n| puts n.node_name }

should_fail = Tree2.new({'test'=>{},'root2'=>{}})
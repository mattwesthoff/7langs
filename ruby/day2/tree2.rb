class Tree2
    attr_accessor :children, :node_name
    
    def initialize(data={})
        raise ArgumentError, "tree data cannot have multiple roots" if data.length > 1
        
        #{}.take(1)[0] = nil, so this is safe
        @node_name, child_hash = data.take(1)[0]
        @children = child_hash.map {|k,v| Tree2.new({k => v}) } if child_hash
    end
    
    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all(&block) }
    end
    
    def visit(&block)
        block.call self
    end
end


empty_tree = Tree2.new()

puts "no child tree:"
no_children = Tree2.new('mountain_goats'=>{})
no_children.visit_all {|n| puts n.node_name }
puts

puts "tree from book:"
tree = Tree2.new({'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})
tree.visit_all {|n| puts n.node_name }
puts

puts "should tell you that you can't have two roots:"
should_fail = Tree2.new({'test'=>{},'root2'=>{}})
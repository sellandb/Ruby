class Tree
	attr_accessor :children, :node_name

	def initialize(tree)		
		top = tree.shift
		@node_name = top[0]
		@children = []
		top[1].each do
			child = top[1].shift
			childInit = {child[0] => child[1]}
			@children.push(Tree.new(childInit))
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new({'grandpa' => {'dad' => {'child1' => {}, 'child2' => {}}, 'uncle' => {'child3' => {}, 'child4' => {} } } })

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
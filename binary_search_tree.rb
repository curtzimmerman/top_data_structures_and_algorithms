class Node
  attr_accessor :value, :left_child, :right_child, :parent
  def initialize ( value = nil )
    @value = value
  end

  def insert ( new_node )
    if new_node.value < self.value
      if self.left_child.nil?
        new_node.parent = self
        self.left_child = new_node
      else 
        left_child.insert( new_node )
      end
    elsif new_node.value > self.value
      if self.right_child.nil?
        new_node.parent = self
        self.right_child = new_node
      else
        right_child.insert( new_node )
      end
    else
      puts "#{new_node.value} is already in the tree."
    end
  end
end

def build_tree ( array )
  root = Node.new(array.shift)
  array.each do |value|
    root.insert(Node.new(value))
  end
  root
end 

def breadth_first_search ( tree, value )
  queue = [tree]
  until queue.empty?
    target = queue.shift
    return target if target.value == value
    queue << target.left_child if target.left_child
    queue << target.right_child if target.right_child
  end
  return nil
end


def depth_first_search ( tree, value )
  stack = [tree]
  until stack.empty?
    target = stack.pop
    return target if target.value == value
    stack.push target.right_child if target.right_child
    stack.push target.left_child if target.left_child
  end
  return nil

end


def dfs_rec ( target_node, value )
  return target_node if target_node.value == value
  dfs_rec( target_node.left_child, value ) if target_node.left_child
  dfs_rec( target_node.right_child, value ) if target_node.right_child
end



t = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts breadth_first_search( t, 6345 )

puts depth_first_search( t, 6345 )

puts dfs_rec( t, 6345 )
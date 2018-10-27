class PolyTreeNode
  #three instances:
  attr_accessor :parent, :value, :children 
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent=(node) #current node = node1, self = node2, node3
    if node == nil 
      #self.parent == n1
      self.parent.children.delete(self)
    elsif self.parent
      self.parent.children.delete(self)
      node.children << self unless node.children.include?(self)
    else
      node.children << self unless node.children.include?(self)
    end 
    @parent = node 
  end
  
  def add_child(child_node) #current node = node1, self = node2, node3
    child_node.parent=(self)
  end
  
  def remove_child(child_node)#
    child_node.parent=(nil)
  end
  
  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      memo = child.dfs(target_value)
      return memo if memo != nil  
    end 
    nil 
  end
  
  def bfs(target_value)
    local_arr = [self]
    return self if self.value == target_value
    until local_arr.empty?
      self.children.each do |child| 
        memo = local_arr.shift
        return memo if memo.value == target_value
        local_arr << child unless local_arr.include?(child)
      end 
    end
    nil
  end
  
  
  
end
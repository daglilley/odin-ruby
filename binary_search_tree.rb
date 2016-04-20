class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value, parent=nil, black=true)
    @value = value
    @parent = parent
    @black = black
    @left = nil
    @right = nil
  end

  def has_child?
    return !left.nil? || !right.nil?
  end

  def black?
    return @black
  end

  def set_black
    @black = true
  end

  def set_red
    @black = false
  end
end

class RBT
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  def add_node(value)
    p = @head
    n = Node.new(value)
    while p.has_child?
      if value < p.value && !p.left.nil?
        p = p.left
      elsif value >= p.value && !p.right.nil?
        p = p.right
      else
        break
      end
    end
    n.parent = parent
    n.set_red
    value < p.value ? p.left = n : p.right = n
    rebalance(n)
    @head = find_head(n)
  end

  def rebalance(n)
    case_1(n)
  end

  def case_1(n)
    p = n.parent
    if p == null then n.set_black else case_2(n, p) end
  end

  def case_2(n, n)
    if !p.black? then case_3(n, p) end
  end

  def case_3(n, p)
    g = p.parent
    if p == g.left then u = g.right else u = g.left end
    if u == null || u.black?
      case_4(n, p, g)
    else
      p.set_black
      u.set_black
      g.set_red
      case_1(g)
    end
  end

  def case_4(n, p, g)
    if n == p.right && p == g.left
      rotate_left(n, p, g)
      p = n
      n = n.left
    elsif n == p.left && p == g.left
      rotate_right(n, p, g)
      p = n
      n = n.right
    end
    case_5(n, p, g)
  end

  def case_5(n, p, g)
    p.set_black
    g.set_red
    if n == p.left
      rotate_right(n, p, g)
    else
      rotate_left(n, p, g)
    end
  end

  def rotate_left(n, p, g)
    p.right = n.left
    p.parent = n
    n.left = p
    n.parent = g
    g.left = n
  end

  def rotate_right(n, p, g)
    p.left = n.right
    p.parent = n
    n.right = p
    n.parent = g
    g.right = n   
  end

  def find_head(n)
    if n.parent != null then find_head(n.parent) else return n end
  end
end


def build_tree(data, parent=nil)
  middle = data.length/2
  node = Node.new(data[middle], parent)
  node.child1 = build_tree(data[0...middle], node) if data.length > 1
  node.child2 = build_tree(data[middle..-1], node) if data.length > 2
  return node
end


def build_rb_tree(data) #[3,4,23,8,6345,7,9,1,324,7,4,5,67,9]
  head = Node.new(data.shift)
  tree = RBT.new(head)
  data.each do |value|
    tree.add_node(value)
  end
end


def breadth_first_search
  # Returns node with given value
  # Use queue array to keep track of child nodes
end

def depth_first_search
  # Use stack array
end

def dfs_rec
  # depth first search that is recursive
end


sorted_data = [1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
tree = build_tree(sorted_data)

unsorted_data = [3, 4, 23, 8, 6345, 7, 9, 1, 324, 7, 4, 5, 67, 9]
rbtree = build_rb_tree(unsorted_data)






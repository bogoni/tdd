class Tree_node
  attr_reader :name

  def initialize(name)
    @name = name
    @children = []
  end

  def add_node(node)
    @children << node
  end

  def each_depth_first
    yield self    
    @children.each do |child|
      child.each_depth_first do |c|
        yield c
      end
    end
  end
end
# frozen_string_literal: true

# contains the node's
class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# contains the full list
class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def sizes
    current_node = @head
    until current_node.nil?
      current_node = current_node.next_node
      @size += 1
    end
    print "There are: #{@size} nodes"
  end

  def append(value)
    # adds a new node containing .value to the end of the list
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def prepends(value)
    # adds a new node containing .value to the start of the list
    node = Node.new(value)
    node.next_node = @head
    if tail.nil?
      @tail = node
    end
    @head = node
  end

  def at(index)
    # returns the node at the given index
  end

  def pops
    # removes the last element from the list
    @size -= 1
    current_node = @head
    until current_node.nil?
      current_node = current_node.next_node
    end
    current_node.next_node = current_node.next_node.next_node
  end

  def to_string
    # represets LinkedList values as strings, so you can print them out and preview
    # them in console. The format is ...
    return nil if @head.nil?

    str = ''
    current = @head
    puts "\n"
    until current.nil?
      str += "(#{current.value}) -> "
      str += 'nil' if current.next_node.nil?
      current = current.next_node
    end
    str
  end
end

nodes = LinkedList.new
nodes.append('1')
nodes.append('2')
nodes.append('3')
nodes.append('4')

nodes.pops
nodes.sizes
puts nodes.to_string

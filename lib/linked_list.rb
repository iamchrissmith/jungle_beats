class LinkedList
  attr_reader :head
  attr_accessor :count
  def initialize(head = nil)
    @head = head
    @count = 0
  end
  def increase_count
    @count += 1
  end

  def success(node)
    increase_count
    node.data
  end

  def travel_links(stop = @count-1)
    links = 0
    current_node = @head
    until links >= stop
      current_node = current_node.next_node
      links +=1
    end
    current_node
  end

  def assign_head(data)
    @head = Node.new(data)
  end

  def assign_next_node(current_node, data, next_node = nil)
    current_node.next_node = Node.new(data, next_node)
    current_node
  end

  def swap_head(data)
    old_node = @head
    @head = Node.new(data)
    assign_next_node(@head, old_node.data, old_node.next_node)
  end

  def swap_node(current_node, data)
    old_node = current_node
    new_node = Node.new(data)
    assign_next_node(new_node, old_node.data, old_node.next_node)
  end

  def prepend(data)
    added_node = @head != nil ? swap_head(data) : assign_head(data)
    success(added_node)
  end

  def insert(location, data)
    current_node = travel_links(location)
    previous_node = travel_links(location - 1)
    previous_node.next_node = Node.new(data, current_node)
    added_node = previous_node.next_node
    success(added_node)
  end

  def append(data)
    last_node = @head
    if !last_node
      added_node = assign_head(data)
    else
      # binding.pry
      last_node = travel_links
      added_node = assign_next_node( last_node, data)
    end
    success(added_node)
  end

  def find(start, length)
    node = travel_links (start)
    distance = 0
    string = ''
    until !node.next_node || length == distance
      string += "#{node.data} "
      node = node.next_node
      distance += 1
    end
    string.rstrip
  end

  def includes?(needle)
    found = false
    node = @head
    until found || node == nil
      node.data == needle ? found = true : node = node.next_node
    end
    found
  end

  def pop
    to_remove = travel_links (count-1)
    new_last = travel_links (count-2)
    new_last.next_node = nil
    @count -= 1
    to_remove.data
  end

  def to_string
    string = ''
    string += @head.data.to_s unless nil
    next_node = @head.next_node
    while next_node
      string += " #{next_node.data.to_s}"
      next_node = next_node.next_node
    end
    string
  end
end

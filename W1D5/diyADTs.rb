class Stack
  attr_accessor :stack
  def initialize
    @stack = []
    # create ivar to store stack here!
  end

  def push(el)
    @stack.push(el)
    # adds an element to the stack
  end

  def pop
    stack.pop
    # removes one element from the stack
  end

  def peek
    return stack.last
    # returns, but doesn't remove, the top element in the stack
  end
end

class Queue
  attr_accessor :queue
  def initialize
    @queue = []
  end
  def enqueue(el)
    queue.push(el)
  end

  def dequeue
    queue.shift
  end

  def peek
    queue.first
  end
end

class Map
  def set(key,value)
    self.each do |k,v|
      if self[0] == k
        self.delete([key,value])
      end
    end
    return self + [[key,value]]
  end

  def get(key)
    self.each do |k,v|
      if k == key
        return v
      end
    end
    return "Key not found"
  end

  def delete(key)
    self.each do |k,v|
      if self[0] == k
        return self.delete([key,value])
      end
    end
    "Key not found"
  end
end

class StackQueue

  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(element)
    @in_stack.push(element)
  end

  def dequeue(element)
    until @in_stack.empty?
      @out_stack.push(@in_stack.pop)
    end

    return_element = @out_stack.pop

    until @out_stack.empty?
      @in_stack.push(@out_stack.pop)
    end
  end

  def size
  end

  def empty?
  end

  end
end


class MyStack
  def initialize
   @store = []
  end

  def pop
    @store.pop
  end

  def push
    @store.push
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end


class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift
  end

  def dequeue
    @store.pop
  end

  def peek
    @store[0]
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end

class Queue
    def initialize
      # create ivar to store stack here!
      @queue = []
    end

    def enqueue(el)
      @queue << el
    end

    def dequeue
      @queue.shift
    end

    def peek
      @queue[0]
    end

    def <<(ele)
        enqueue(ele)
    end
end
stack = Queue.new
stack << 3
stack << 5
stack << 1
p stack.dequeue
p stack.peek
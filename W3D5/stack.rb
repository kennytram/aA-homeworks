class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      @stack << el
    end

    def pop
      @stack.pop
    end

    def peek
      @stack[0]
    end

    def <<(ele)
        @stack.push(ele)
    end
end
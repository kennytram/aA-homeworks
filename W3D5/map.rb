class Map
    def initialize
      # create ivar to store stack here!
      @map = []
    end

    def set(key, value)
      idx = @map.index {|kv| kv[0] == key}
      if idx
        @map[idx][1] = value
      else
        @map << [key, value]
      end
    end

    def get(key, value)
        @map.each {|kv| return kv[1] if kv[0] == key}
        nil
    end

    def delete(key)
        value = get(key)
        @map.reject! { |kv| kv[0] == key }
        value
      end

    def deep_copy(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end  

    def show
        deep_copy(@map)
    end
end
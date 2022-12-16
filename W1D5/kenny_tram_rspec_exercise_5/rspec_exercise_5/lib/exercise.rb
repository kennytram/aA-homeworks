def zip(*arr)
    res = []
    (0...arr[0].length).each do |i|
        temp = []
        (0...arr.length).each do |j|
            temp << arr[j][i]
        end
        res << temp
    end
    res
end

def prizz_proc(arr, proc1, proc2)
    arr.select {|ele| ele if proc1.call(ele) ^ proc2.call(ele)}
end

def zany_zip(*arr)
    res = []
    max = -1
    arr.each do |sub_arr|
        max = [sub_arr.length, max].max
    end
    (0...max).each do |i|
        temp = []
        arr.each do |sub_arr|
            value = nil
            if i < sub_arr.length
                value = sub_arr[i]
            end
            temp << value
        end
        res << temp
    end
    res
end

def maximum(arr, &block)
    return nil if arr.length == 0
    values = arr.map {|ele| block.call(ele) }
    values.reverse!
    reverse_max_index = values.index(values.max)
    return arr[reverse_max_index*-1-1]
end

def my_group_by(arr, &block)
    res = {}
    arr.each do |ele|
        proc_outcome = block.call(ele)
        if res.has_key?(proc_outcome)
            res[proc_outcome] << ele
        else
            res[proc_outcome] = [ele]
        end
    end
    res
end

def max_tie_breaker(arr, proc, &block)
    return nil if arr.length == 0

    max = -1
    arr.each do |ele|
        max = [max, block.call(ele)].max
    end
    largest_arr = arr.select {|ele| ele if block.call(ele) == max}
    
    return largest_arr[0] if largest_arr.length == 1

    max = -1
    largest_arr.each do |ele|
        max = [max, proc.call(ele)].max
    end
    res = largest_arr.select {|ele| ele if proc.call(ele) == max}

    res[0]

end

def silly_syllables(sentence)
    res = []
    vowels = "aeiou"
    sentence.split.each do |word|
        vowel_count = 0
        vowel_indexes = []
        i = 0
        while i < word.length
            if vowels.include?(word[i])
                vowel_count += 1
                vowel_indexes << i
            end
            i += 1
        end
        if vowel_count >= 2
            res << word[vowel_indexes[0]..vowel_indexes[-1]]
        else
            res << word
        end
    end
    res.join(" ")
end
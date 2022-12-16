def duos(str)
    res = 0
    i = 0
    while i < str.length-1
        if str[i] == str[i+1]
            res += 1
            curr = str[i]
            while curr == str[i+1]
                i += 1
            end
        end
        i += 1
    end
    res
end

def sentence_swap(sentence, hash)
    res = []
    sentence.split.each do |word| 
        if hash.has_key?(word)
            res << hash[word]
        else
            res << word
        end
    end
    res.join(" ")
end

def hash_mapped(hash, proc, &block)
    res = {}
    hash.each do |k, v|
        new_key = block.call(k)
        res[new_key] = proc.call(v)
    end
    res
end

def counted_characters(str)
    str.each_char.uniq.select {|char| str.count(char) > 2}
end

def triplet_true?(str)
    str.each_char {|char| return true if str.count(char) >= 3}
    false
end

def energetic_encoding(str, hash)
    str.each_char.map do |char|
        if hash.has_key?(char)
            hash[char]
        else
            if char == ' '
                ' '
            else
                '?'
            end
        end
    end.join("")
end

def conjunct_select(arr, *procs)
    res = arr
    procs.each do |proc|
        res = res.select {|n| n if proc.call(n)}
    end
    res
end

def convert_pig_latin(str)
    words = str.split

    def convert_word(word)
        vowels = "aeiou"
        return word + 'yay' if vowels.include?(word[0].downcase)
        word.each_char.with_index do |char, i|
            if vowels.include?(char)
                return word[i..-1].downcase + word[0...i].downcase + 'ay'
            end
        end
    end

    words.map do |word|
        if word.length >= 3
            new_word = convert_word(word)
            if word[0] == word[0].upcase
                new_word[0] = new_word[0].upcase
            end
            new_word
        else
            word
        end
    end.join(" ")
end

def uncompress(str)
    res = ""
    str.each_char do |char|
        if char.match?(/[0-9]/)
            n_times = char.to_i - 1
            n_times.times do
                res += res[-1]
            end
        else
            res += char
        end
    end
    res
end

def reverberate(str)
    words = str.split

    def convert_word(word)
        vowels = "aeiou"
        return word + word.downcase if vowels.include?(word[-1].downcase)
        word.reverse.each_char.with_index do |char, reverse_i|
            if vowels.include?(char)
                i = word.length - reverse_i - 1
                return word[0..i-1].downcase + word[i..-1].downcase + word[i..-1].downcase
            end
        end
    end

    words.map do |word|
        if word.length >= 3
            new_word = convert_word(word)
            if word[0] == word[0].upcase
                new_word[0] = new_word[0].upcase
            end
            new_word
        else
            word
        end
    end.join(" ")
end

def disjunct_select(arr, *procs)
    res = []
    arr.each do |ele|
        procs.each do |proc| 
            if proc.call(ele)
                res << ele
                break
            end
        end
    end
    res
end

def alternating_vowel(str)
    res = []
    vowels = "aeiou"
    to_remove_first_vowel = true
    str.split.each do |word|
        if to_remove_first_vowel
            i = 0
            while i < word.length and !(vowels.include?(word[i])) 
                i += 1
            end
            if i < word.length
                res << word[0...i] + word[i+1..-1]
            else
                res << word
            end
        else
            i = word.length-1
            while i >= 0 and !(vowels.include?(word[i]))
                i -= 1
            end
            if i >= 0
                res << word[0...i] + word[i+1..-1]
            else
                res << word
            end
        end
        to_remove_first_vowel = !to_remove_first_vowel
    end
    res.join(" ")
end

def silly_talk(str)
    words = str.split

    def convert_word(word)
        vowels = "aeiou"
        return word + word[-1] if vowels.include?(word[-1].downcase)
        modified_word = ""
        word.each_char.with_index do |char, i|
            if vowels.include?(char.downcase)
                modified_word += word[i] + 'b' + word[i].downcase
            else
                modified_word += word[i]
            end
        end
        return modified_word
    end

    words.map do |word|
        new_word = convert_word(word)
        if word[0] == word[0].upcase
            new_word[0] = new_word[0].upcase
        end
        new_word
    end.join(" ")
end

def compress(str)
    res = ""
    count = 0
    curr = nil
    str.each_char do |char|
        if curr != char
            res += count.to_s if count > 1
            res += char
            count = 1
            curr = char
        else
            count += 1
        end
    end
    res += count.to_s if count > 1
    res
end
require 'exercise'

describe "duos" do
    it "should a string as an argument" do
        expect { duos('bootcamp') }.to_not raise_error
    end

    it "should return  the count of the number of times the same character appears consecutively in the given string" do
        expect(duos('bootcamp')).to eq(1)
        expect(duos('wxxyzz')).to eq(2)
        expect(duos('hoooraay')).to eq(2)
        expect(duos('dinosaurs')).to eq(0)
        expect(duos('e')).to eq(0)
    end
end

describe "sentence_swap" do

    it "should accept a sentence and a hash as arguments" do
        expect { sentence_swap('anything you can do I can do',
            'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
        ) }.to_not raise_error
    end

    it "should return a new sentence where every word is replaced with it's corresponding value in the hash" do
        expect(
            sentence_swap('anything you can do I can do',
                'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
            )
        ).to eq('nothing you shall drink I shall drink')

        expect(
            sentence_swap('what a sad ad',
                'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
            )
        ).to eq('make a happy ad')

        expect(
            sentence_swap('keep coding okay',
                'coding'=>'running', 'kay'=>'pen'
            )
        ).to eq('keep running okay')
    end
end
describe "hash_mapped" do
    double = Proc.new { |n| n * 2 }
    first = Proc.new { |a| a[0] }
    it "should accept a hash, a proc, and a block as arguments" do
        expect { hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' } }.to_not raise_error
    end

    it "should return a new hash where each key is the result of the original key when given to the blockt" do
        expect(hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }).to eq({"A!!"=>8, "X!!"=>14, "C!!"=>-6})

        expect(hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }).to eq({25=>"q", 36=>"w"})
    end
end

describe "counted_characters" do
    it "should accept a string as an argument" do
        expect { counted_characters("that's alright folks") }.to_not raise_error
    end

    it "should return an array containing the characters of the string that appeared more than twice" do
        expect(counted_characters("that's alright folks")).to eq(["t"])
        expect(counted_characters("mississippi")).to eq(["i", "s"])
        expect(counted_characters("hot potato soup please")).to eq(["o", "t", " ", "p"])
        expect(counted_characters("runtime")).to eq([])
    end
end

describe "triplet_true?" do
    it "should accept a string as an argument" do
        expect{ triplet_true?('caaabb') }.to_not raise_error
    end

    it "should return a boolean indicating whether or not the string contains three of the same character consecutively" do
        expect(triplet_true?('caaabb')).to eq(true)
        expect(triplet_true?('terrrrrible')).to eq(true)
        expect(triplet_true?('runninggg')).to eq(true)
        expect(triplet_true?('bootcamp')).to eq(false)
        expect(triplet_true?('e')).to eq(false)
    end
end

describe "energetic_encoding" do
    it "should accept a string and a hash as arguments" do
        expect { energetic_encoding('sent sea',
        'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
    ) }.to_not raise_error
    end

    it "should return a new string where characters of the original string are replaced with the corresponding values in the hash" do
        expect(energetic_encoding('sent sea',
        'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
    )).to eq('zimp ziu')
        expect(energetic_encoding('cat',
            'a'=>'o', 'c'=>'k'
        )).to eq('ko?')
        expect(energetic_encoding('hello world',
            'o'=>'i', 'l'=>'r', 'e'=>'a'
        )).to eq('?arri ?i?r?')
        expect(energetic_encoding('bike', {})).to eq('????')

    end
end

describe "uncompress" do
    it "should accept a string as an argument" do
        expect { uncompress('a2b4c1') }.to_not raise_error
    end

    it "should return an "'uncompressed'" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter" do
        expect(uncompress('a2b4c1')).to eq('aabbbbc')
        expect(uncompress('b1o2t1')).to eq('boot')
        expect(uncompress('x3y1x2z4')).to eq('xxxyxxzzzz')
    end
end

describe "conjunct_select" do
    is_positive = Proc.new { |n| n > 0 }
    is_odd = Proc.new { |n| n.odd? }
    less_than_ten = Proc.new { |n| n < 10 }
    it "should accept an array and one or more procs as arguments" do
        expect { conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) }.to_not raise_error
    end

    it "should return a new array containing the elements that return true when passed into all of the given procs" do
        

        expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive)).to eq([4, 8, 11, 7, 13])
        expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd)).to eq([11, 7, 13])
        expect(conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten)).to eq([7])
    end
end
describe "convert_pig_latin" do
    it "should accept a string as an argument" do
        expect { convert_pig_latin('We like to eat bananas') }.to_not raise_error
    end

    it "should translate the sentence according to the following rules:
    words that are shorter than 3 characters are unchanged
    words that are 3 characters or longer are translated according to the following rules:
    if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
    if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')" do
        expect(convert_pig_latin('We like to eat bananas')).to eq("We ikelay to eatyay ananasbay")
        expect(convert_pig_latin('I cannot find the trash')).to eq("I annotcay indfay ethay ashtray")
        expect(convert_pig_latin('What an interesting problem')).to eq("Atwhay an interestingyay oblempray")
        expect(convert_pig_latin('Her family flew to France')).to eq("Erhay amilyfay ewflay to Ancefray")
        expect(convert_pig_latin('Our family flew to France')).to eq("Ouryay amilyfay ewflay to Ancefray")
    end
end
describe "reverberate" do
    it "should accept a string as an argument" do
        expect { reverberate('We like to go running fast') }.to_not raise_error
    end

    it "should translate the sentence according to the following rules:

    words that are shorter than 3 characters are unchanged
    words that are 3 characters or longer are translated according to the following rules:
    if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
    if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')" do
        expect(reverberate('We like to go running fast')).to eq("We likelike to go runninging fastast")
        expect(reverberate('He cannot find the trash')).to eq("He cannotot findind thethe trashash")
        expect(reverberate('Pasta is my favorite dish')).to eq("Pastapasta is my favoritefavorite dishish")
        expect(reverberate('Her family flew to France')).to eq("Herer familyily flewew to Francefrance")
    end
end

describe "disjunct_select" do
    longer_four = Proc.new { |s| s.length > 4 }
    contains_o = Proc.new { |s| s.include?('o') }
    starts_a = Proc.new { |s| s[0] == 'a' }
    it "should accept an array and one or more procs as arguments" do
        expect { disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
        longer_four,
    ) }.to_not raise_error
    end

    it "should return a new array containing the elements that return true when passed into at least one of the given procs" do
        expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
        longer_four,
    )).to eq(["apple", "teeming"])
        expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
        longer_four,
        contains_o
    )).to eq(["dog", "apple", "teeming", "boot"])
        expect(disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
        longer_four,
        contains_o,
        starts_a
    )).to eq(["ace", "dog", "apple", "teeming", "boot"])
    end
end

describe "alternating_vowel" do
    it "should accept a string as an argument" do
        expect { alternating_vowel('panthers are great animals') }.to_not raise_error
    end

    it "should return a new sentence where the words alternate between having their first or last vowel removed" do
        expect(alternating_vowel('panthers are great animals')).to eq("pnthers ar grat animls")
        expect(alternating_vowel('running panthers are epic')).to eq("rnning panthrs re epc")
        expect(alternating_vowel('code properly please')).to eq("cde proprly plase")
        expect(alternating_vowel('my forecast predicts rain today')).to eq("my forecst prdicts ran tday")
    end
end

describe "silly_talk" do
    it "should accept a string as an argument" do
        expect { silly_talk('Kids like cats and dogs') }.to_not raise_error
    end

    it "should return an "'uncompressed'" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter" do
        expect(silly_talk('Kids like cats and dogs')).to eq("Kibids likee cabats aband dobogs")
        expect(silly_talk('Stop that scooter')).to eq("Stobop thabat scobooboteber")
        expect(silly_talk('They can code')).to eq("Thebey caban codee")
        expect(silly_talk('He flew to Italy')).to eq("Hee flebew too Ibitabaly")
    end
end

describe "compress" do
    it "should accept a string as an argument" do
        expect { compress('aabbbbc') }.to_not raise_error
    end

    it "should return an "'uncompressed'" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter" do
        expect(compress('aabbbbc')).to eq('a2b4c')
        expect(compress('boot') ).to eq('bo2t')
        expect(compress('xxxyxxzzzz')).to eq('x3yx2z4')
    end
end

class WordChainer

    attr_reader :Dictionary

    def initialize(dictionary_file_name)
        #@Dictionary 
        file = File.open(dictionary_file_name)
        @Dictionary = file.readlines.map(&:chomp)
        file.close
        

    end

    def adjacent_words(word)
        same_length = @Dictionary.select{|el| el.length == word.length}
        potential_words = []
        same_length.each do |el|
            (0..word.length-1).each do |i|
                temp_el = el.dup
                temp_word = word.dup
                temp_el.slice!(i)
                temp_word.slice!(i)
                if temp_el == temp_word
                    potential_words << el if el != word && !potential_words.include?(el)
                end
            end
        end
        potential_words
    end

    def run(source,target)
        @current_words = [source]
        @all_seen_words = [source]
        while @current_words.length > 0 do 
            new_current_words = []
            @current_words.each do |el|
                ad_words = adjacent_words(el)
                ad_words.each do |i|
                    if !@all_seen_words.include?(i)
                        new_current_words << i
                        @all_seen_words << i
                    end
                end
            end
            p new_current_words
            @current_words = new_current_words
        end
    end


end

wc = WordChainer.new('dictionary.txt')
#p wc.Dictionary
p wc.adjacent_words("fence")
wc.run("rose", "post")
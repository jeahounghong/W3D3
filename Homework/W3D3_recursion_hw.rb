
def sum_to(n)
    return nil if n < 0
    return 0 if n == 0
    return 1 if n == 1
    return n + sum_to(n-1)
end
puts "SUM TO"
p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil
puts

def add_numbers(nums_array)
    return nil if nums_array.length == 0
    return nums_array[0] if nums_array.length == 1
    return nums_array.pop + add_numbers(nums_array)
end
puts "ADD NUMBERS"
p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil
puts

def gamma_fnc(n)
    return 1 if n == 1
    return nil if n == 0
    return (n-1)*gamma_fnc(n-1)
end
puts "GAMMA FUNCTION"
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040
puts

def ice_cream_shop(flavors, favorite)
    return false if flavors.length == 0
    return favorite == flavors.pop || ice_cream_shop(flavors, favorite)
end
puts "ICE CREAM SHOP"
p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false
puts

def reverse(str)
    return "" if str == ""
    return str[-1] + reverse(str[0...-1])
end
puts "REVERSE"
p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""
puts

def quicksort(arr)
    return arr if arr.length < 2
    middle = arr[0]
    left = []
    right = []
    arr.drop(1).each do |el|
        left << el if el < middle
        right << el if el >= middle
    end

    return quicksort(left) + [ middle ] + quicksort(right)

end
puts "quick sort"
arr = [1,5,3,2,7,5,4,3,7,2,1]
p arr
print quicksort(arr)
puts


# [0,1] n == 2
# [0] n == 1

def all_fibs(n)
    $count += 1
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    # all_fibs[3] = [0,1,1]
    arr = all_fibs(n-1)
    #return arr + [ arr[-2..-1].sum ] 
    return all_fibs(n-1) + [all_fibs(n-1)[-1] + all_fibs(n-1)[-2]]
end

# arr = []
# (0..10).each do |i|
#     $count = 0
#     all_fibs(i)
#     arr << [i,$count]
# end
# p arr

puts
def pascal(n)
    return [] if n == 0
    return [1] if n == 1
    return [1,1] if n == 2
    arr = []
    pascal_before = pascal(n-1)
    (0...pascal_before.length - 1).each do |i|
        arr << pascal_before[i] + pascal_before[i+1]
    end
    return [1] + arr + [1]
end

p pascal(3)
p pascal(4)
p pascal(5)
p pascal(6)
p pascal(7)
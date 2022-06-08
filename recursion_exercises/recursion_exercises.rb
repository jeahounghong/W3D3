# def range(start, final)
#     #base case
#     return [] if final < start
#     if start == final 
#         return [final] 
#     end
#     return [start] + range(start+1, final)


# end
# puts "RANGE"
# p range(1,5)
# p range(5,1)
# p range(0,1)
# p range(1,1)

# $count = 0
# def exp1(base, num)
#     $count += 1
#     return 1 if num == 0
#     return base * exp1(base, num-1)
# end

# p exp1(2,256)
# #p exp1(2,0)
# p $count

# $count2 = 0
# def exp2(base, num)
#     $count2 += 1
#     return 1 if num == 0 
#     return base if num == 1
#     if num % 2 == 0
#         var_even = exp2(base, num/2) 
#         return var_even * var_even
#     else
#         var_odd = exp2(base, (num-1)/2)
#         return base * var_odd *var_odd
#     end
# end

# p exp2(2,256)
# #p exp1(2,0)
# p $count2

# 0^0 = num == 0 => *1*
# 0^1 = num == 1 => 0
# 1^0 = num == 0 => 1
# 1^1 = num == 1 => 1
# 1^2 = num == 2 => exp(1,1) * exp(1,1) = 1
# 2^2 = num == 2 => exp(2,1) * exp(2,1) = 4


class Array

    def deep_dup
        dup = []
        self.each do |part|
            if part.is_a?(Array)
                dup << part.deep_dup
            else
                dup << part
            end
            
            # dup += part
        end
        return dup 
    end
end

# arr = [1,[2,3],4,5]
# arr2 = arr.deep_dup
# p arr2[1]
# arr[1] << 3
# p arr[1]
# p arr2[1]


# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", ["pipes", "screws"], "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup
# robot_parts_copy[1] << "LEDs"
# p robot_parts
# puts
# p robot_parts_copy
# puts

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

def bsearch(array,target)
    # if array.length < 1
    #     return nil
    # end
    return nil if array.length < 1
    if array.length == 1
        return 0 if target == array[0]
        return nil
    end
    mid_idx = array.length/2
    middle = array[mid_idx]
    return mid_idx if middle == target
    if (middle < target)
        var = bsearch(array[mid_idx + 1 .. - 1 ], target)
        if var == nil
            return nil 
        else
            return mid_idx + var + 1
        end
    else
        return bsearch(array[0...mid_idx], target)
    end
    nil
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    if array.length <= 1
        return array
    end
    middle = array.length/2
    p "middle is #{middle}"
    left = array[0...middle]
    right = array[middle..-1]
    puts
    p left
    p right
    left = merge_sort(left)
    right = merge_sort(right)

    

    return merge(left,right)
end

def merge(arr1, arr2)
    result = []
    while arr1.length > 0 && arr2.length > 0 do
        if arr1[0] <= arr2[0]
            result << arr1.shift
        else
            result << arr2.shift
        end
    end

    while arr1.length > 0 do
        min1 = arr1.inject do |acc,el|
            el < acc ? el : acc
        end
        result << min1
        arr1.slice!(arr1.index(min1))
    end

    while arr2.length > 0 do 
        min2 = arr2.inject do |acc,el|
            el < acc ? el : acc
        end
        
        result << min2
        arr2.slice!(arr2.index(min2))
    end
    p result
    return result
end

arr = [5,3,7,3,2,4,5,9]
p merge_sort(arr)

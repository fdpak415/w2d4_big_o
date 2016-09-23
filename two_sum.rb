
# TIME COMPLEXITY
# QUADRATIC: O(n^2)
require 'byebug'

def bad_two_sum(array, target)
  array.each_with_index do |num, idx|        # n
    ((idx + 1)..(array.length - 1)).each do |idx2|     #n
      return true if num + array[idx2] == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum(arr, 6) # => should be true
# p bad_two_sum(arr, 10) # => should be false


# n * log n
#LINEARITHMIC
sorted = arr.sort
def okay_two_sum?(sorted, target)

  sorted.each_with_index do |num, i|                 # n
    new_target = target - num
    if i < (sorted.length - 1)
      if b_search(sorted[(i + 1)..-1], new_target) != nil   #binary search log n
        return true
      end
    end
  end

  false
end

def b_search(sorted, target)
  mid = sorted.length / 2
  return target if sorted[mid] == target
    return nil if sorted.length == 1 && sorted[mid] != target

  if target < sorted[mid]
    return b_search(sorted[0...mid], target)
  else
    return  b_search(sorted[mid..-1], target)
  end

end

# p okay_two_sum?(arr, 6) # => should be true
# # debugger
# p okay_two_sum?(arr, 10) # => should be false



arr = [0, 1, 5, 7]
#hash map
#total search is O(n) time

def hash_two_sum(arr, target)
  hash = Hash.new { 0 }

  arr.each do |n|   #populate hash in O(n) time
    hash[n] += 1
  end

  hash.each do |key, value|  # iteration is O(n) time
    current_difference = target - key

    if hash.has_key?(current_difference) #access of hash is O(1) time
      if current_difference == key && hash[key] > 1
        return true
      elsif current_difference != key
        return true
      end
    end
  end

  false
end

p hash_two_sum(arr, 6) # => should be true
p hash_two_sum(arr, 10) # => should be false

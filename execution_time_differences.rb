
# Phase I
# First, write a function that compares each element to every other element of the list.
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?
# TIME COMPLEXITY:
# loop: n
# nested loop: n
# Quadratic: n^2

def my_min(list)
  # min = self.first

  list.each_with_index do |num1, idx1|
    current_num_is_min = true
    list.each_with_index do |num2, idx2|
      if idx1 != idx2 && num1 > num2
        current_num_is_min = false
      end
    end
    return num1 if found_min == true
  end

end


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


# Phase II
#
# Now rewrite the function to iterate through the list just once while
# keeping track of the minimum. What is the time complexity?

# O(n) Linear

def my_min_iter(list)
  current_min = list.first

  list.each do |num|
    if num < current_min
      current_min = num
    end
  end
  return current_min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_iter(list)  # =>  -5

# loop1 = n
# loop2 = n - 1
# n! + n!
# 2n! => n! (WRONG)

# first element is not factorial -> 4 + 3 + 2 + 1
# first section is n^2
# second n^2 (each along) * inject (n)
# **** n ^ 3


def largest_contiguous_subsum(list)
  i1 = 0
  sub_arrays = []
    while i1 < list.length
      i2 = i1
      while i2 < list.length
      sub_arrays << list[i1..i2]
      i2 += 1
      end
      i1 += 1
    end

  max = list.first

  sub_arrays.each do |sub_array|
    current_max = sub_array.inject(:+)
    max = current_max if current_max > max
  end
  return max
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list1 = [-5, -1, -3]
p largest_contiguous_subsum(list1) # => -1 (from [-1])


# Phase 2
def largest_contiguous_subsum(list)
  max = list.first

  i1 = 0
  sub_arrays = []
    while i1 < list.length
      i2 = i1
      while i2 < list.length
        current_max = list[i1..i2]
        if current_max > max
          max == current_max
        end
      i2 += 1
      end
      i1 += 1
    end

  return max
end

# while loops iterates once so O(n)

# 2n^2 => O(n^2)
def windowed_max_range(array, window_size)
  current_max_range = 0

  i = 0
  while i <= array.length - window_size  #O(n)

    current_slice = array[i..(i + window_size - 1)]

    min = current_slice.min    # O(n)
    max = current_slice.max    # O(n)

    difference = max - min

    if difference > current_max_range
      current_max_range = difference
    end
    i += 1
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

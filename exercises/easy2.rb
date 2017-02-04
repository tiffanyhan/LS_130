require 'pry'

# 1.

# def step(first, last, step)
#   current = first
#   while current <= last
#     yield(current)
#     current += step
#   end
#   current
# end

# step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# 2.

# def zip(arr1, arr2)
#   arr1.map.with_index { |item, index| [item, arr2[index]] }
# end

# puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# 3.

# def map(arr)
#   result = []
#   arr.each { |item| result << yield(item) }
#   result
# end

# puts map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# puts map([]) { |value| true } == []
# puts map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# puts map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# puts map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# 4.

# def count(*arguments)
#   total = 0
#   arguments.each { |item| total += 1 if yield(item) }
#   total
# end

# puts count(1, 3, 6) { |value| value.odd? } == 2
# puts count(1, 3, 6) { |value| value.even? } == 1
# puts count(1, 3, 6) { |value| value > 6 } == 0
# puts count(1, 3, 6) { |value| true } == 3
# puts count() { |value| true } == 0
# puts count(1, 3, 6) { |value| value - 6 } == 3

# 5.

# def drop_while(arr)
#   arr.each_with_index do |item, idx|
#     return arr.slice(idx..-1) unless yield(item)
#   end
#   []
# end

# def drop_while(array)
#   index = 0
#   while index < array.size && yield(array[index])
#     index += 1
#   end

#   array[index..-1]
# end

# puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# puts drop_while([1, 3, 5, 6]) { |value| true } == []
# puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# puts drop_while([]) { |value| true } == []

# 6.

# def each_with_index(arr)
#   count = 0
#   while count < arr.length
#     yield(arr[count], count)
#     count += 1
#   end

#   arr
# end

# def each_with_index(array)
#   index = 0
#   array.each do |item|
#     yield(item, index)
#     index += 1
#   end
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

# 7.

# def each_with_object(arr, obj)
#   arr.each { |item| yield(item, obj) }
#   obj
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# puts result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# puts result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# puts result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# puts result == {}

# 8.

# def max_by(arr)
#   yield_max = nil
#   max_item = nil
#   arr.each do |item|
#     if !yield_max || yield(item) > yield_max
#       yield_max = yield(item)
#       max_item = item
#     end
#   end
#   max_item
# end

# def max_by(array)
#   return nil if array.empty?

#   max_element = array.first
#   largest = yield(max_element)

#   array[1..-1].each do |item|
#     yielded_value = yield(item)
#     if largest < yielded_value
#       largest = yielded_value
#       max_element = item
#     end
#   end

#   max_element
# end

# def max_by(arr)
#   return nil if arr.empty?
#   largest = arr.first
#   arr.each { |item| largest = item if yield(item) > yield(largest) }
#   largest
# end

# puts max_by([1, 5, 3]) { |value| value + 2 } == 5
# puts max_by([1, 5, 3]) { |value| 9 - value } == 1
# puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# puts max_by([-7]) { |value| value * 3 } == -7
# puts max_by([]) { |value| value + 5 } == nil

# 9.

# def each_cons(arr)
#   count = 0
#   while count < arr.length - 1
#     yield(arr[count], arr[count + 1])
#     count += 1
#   end
# end

# def each_cons(array)
#   array.each_with_index do |item, index|
#     break if index + 1 >= array.size
#     yield(item, array[index + 1])
#   end
# end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end

# puts result == nil
# puts hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# puts hash == {}

# hash = {}
# each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# puts hash == {'a' => 'b'}

# 10.

# def each_cons(arr, n)
#   count = 0
#   while count <= arr.length - n
#     args = []
#     1.upto(n-1) { |i| args << arr[count + i] }
#     binding.pry
#     yield(arr[count], *args)
#     count += 1
#   end
# end

# def each_cons(array, n)
#   array.each_index do |index|
#     break if index + n - 1 >= array.size
#     binding.pry
#     yield(*array[index..(index + n - 1)])
#   end
# end

# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   binding.pry
#   hash[value] = true
# end
# puts hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   binding.pry
#   hash[value1] = value2
# end
# puts hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   binding.pry
#   hash[value1] = values
# end
# puts hash == { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# puts hash == { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# puts hash == {}

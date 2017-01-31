# 1. build a 'times' method

# def times(number)
#   counter = 0
#   while counter < number do
#     yield(counter)
#     counter += 1
#   end

#   number
# end

# times(5) do |num|
#   puts num
# end

# 2. build a 'each' method

# def each(array)
#   counter = 0

#   while counter < array.size
#     yield(array[counter])
#     counter += 1
#   end

#   array
# end

# each([1, 2, 3, 4, 5]) do |num|
#   puts num
# end

# 3. build a 'select' method

# def select(array)
#   result = []

#   counter = 0
#   while counter < array.size
#     current_element = array[counter]
#     result << current_element if yield(current_element)
#     counter += 1
#   end

#   result
# end

# array = [1, 2, 3, 4, 5]

# select(array) { |num| num.odd? }      # => [1, 3, 5]
# select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

# 4. build a 'reduce' method

# def reduce(array, accumulator=0)
#   counter = 0

#   while counter < array.size
#     accumulator = yield(accumulator, array[counter])
#     counter += 1
#   end

#   accumulator
# end

# array = [1, 2, 3, 4, 5]

# reduce(array) { |acc, num| acc + num }                    # => 15
# reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

require 'pry'

# 1.

# class Tree
#   include Enumerable

#   def each

#   end
# end

# 2.

# def compute
#   return 'Does not compute.' unless block_given?
#   yield
# end

# puts compute { 5 + 3 } == 8
# puts compute { 'a' + 'b' } == 'ab'
# puts compute == 'Does not compute.'

# 3.

# def missing(arr)
#   result = []

#   arr.first.upto(arr.last) do |num|
#     result << num unless arr.include?(num)
#   end

#   result
# end

# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     binding.pry
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

# puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# puts missing([1, 2, 3, 4]) == []
# puts missing([1, 5]) == [2, 3, 4]
# puts missing([6]) == []

# 4.

# def divisors(num)
#   1.upto(num).select { |divisor| num % divisor == 0 }
# end


# puts divisors(1) == [1]
# puts divisors(7) == [1, 7]
# puts divisors(12) == [1, 2, 3, 4, 6, 12]
# puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# 5.

# ENCRYPTED_PIONEERS = [
#   'Nqn Ybirynpr',
#   'Tenpr Ubccre',
#   'Nqryr Tbyqfgvar',
#   'Nyna Ghevat',
#   'Puneyrf Onoontr',
#   'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#   'Wbua Ngnanfbss',
#   'Ybvf Unyog',
#   'Pynhqr Funaaba',
#   'Fgrir Wbof',
#   'Ovyy Tngrf',
#   'Gvz Orearef-Yrr',
#   'Fgrir Jbmavnx',
#   'Xbaenq Mhfr',
#   'Wbua Ngnanfbss',
#   'Fve Nagbal Ubner',
#   'Zneiva Zvafxl',
#   'Lhxvuveb Zngfhzbgb',
#   'Unllvz Fybavzfxv',
#   'Tregehqr Oynapu'
# ].freeze

# def rot13(encrypted_text)
#   encrypted_text.each_char.reduce('') do |result, encrypted_char|
#     result + decipher_character(encrypted_char)
#   end
# end

# def decipher_character(encrypted_char)
#   case encrypted_char
#   when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
#   when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
#   else                         encrypted_char
#   end
# end

# ENCRYPTED_PIONEERS.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end

# 6.

# def any?(collection)
#   collection.each { |item| return true if yield(item) }
#   false
# end

# puts any?([1, 3, 5, 6]) { |value| value.even? } == true
# puts any?([1, 3, 5, 7]) { |value| value.even? } == false
# puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
# puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# puts any?([1, 3, 5, 7]) { |value| true } == true
# puts any?([1, 3, 5, 7]) { |value| false } == false
# puts any?([]) { |value| true } == false

# 7.

# def all?(collection)
#   collection.each { |item| return false unless yield(item) }
#   true
# end

# puts all?([1, 3, 5, 6]) { |value| value.odd? } == false
# puts all?([1, 3, 5, 7]) { |value| value.odd? } == true
# puts all?([2, 4, 6, 8]) { |value| value.even? } == true
# puts all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# puts all?([1, 3, 5, 7]) { |value| true } == true
# puts all?([1, 3, 5, 7]) { |value| false } == false
# puts all?([]) { |value| false } == true

# 8.

# def none?(collection)
#   collection.each { |item| return false if yield(item) }
#   true
# end

# def none?(collection, &block)
#   !any?(collection, &block)
# end

# puts none?([1, 3, 5, 6]) { |value| value.even? } == false
# puts none?([1, 3, 5, 7]) { |value| value.even? } == true
# puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
# puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# puts none?([1, 3, 5, 7]) { |value| true } == false
# puts none?([1, 3, 5, 7]) { |value| false } == true
# puts none?([]) { |value| true } == true

# 9.

# def one?(arr)
#   true_occurences = 0
#   arr.each do |item|
#     true_occurences += 1 if yield(item)
#     return false if true_occurences > 1
#   end
#   true_occurences == 1
# end

# def one?(collection)
#   seen_one = false
#   collection.each do |element|
#     next unless yield(element)
#     return false if seen_one
#     seen_one = true
#   end
#   seen_one
# end

# puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# puts one?([1, 3, 5, 7]) { |value| true }           # -> false
# puts one?([1, 3, 5, 7]) { |value| false }          # -> false
# puts one?([]) { |value| true }                     # -> false

# 10.

# def count(arr)
#   count = 0
#   arr.each { |item| count += 1 if yield(item) }
#   count
# end

# puts count([1,2,3,4,5]) { |value| value.odd? } == 3
# puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# puts count([1,2,3,4,5]) { |value| true } == 5
# puts count([1,2,3,4,5]) { |value| false } == 0
# puts count([]) { |value| value.even? } == 0
# puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2

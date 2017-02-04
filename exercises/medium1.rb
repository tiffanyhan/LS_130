require 'pry'

# 1.

# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     return unless block_given?
#     message = yield
#     record(message)
#   end

#   def play
#     puts @recordings.last
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

# 2.

# class TextAnalyzer
#   def process
#     File.open("sample.txt", "r") do |file|
#       contents = ""
#       file.each { |line| contents << line }

#       h = Hash.new(0)
#       contents.split("\n").each   { |item| h[:lines]      += 1 unless item.empty? }
#       contents.split("\n\n").each { |item| h[:paragraphs] += 1 unless item.empty? }
#       contents.split("\n\t").each { |item| h[:paragraphs] += 1 unless item.empty? }
#       contents.split("\s").each   { |item| h[:words]      += 1 unless item.empty? }

#       yield(h)
#     end
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process do |analysis|
#   puts "#{analysis[:lines]} lines"
#   puts "#{analysis[:paragraphs]} paragraphs"
#   puts "#{analysis[:words]} words"
# end

# class TextAnalyzer
#   def process
#     file = File.open('sample.txt', 'r')
#     yield(file.read)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").  count} lines" }
# analyzer.process { |text| puts "#{text.split(" ").   count} words" }

# 3.

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Let's start gathering food."
# end

# gather(items) { |food| puts "#{food.join(', ')}" }

# 4.

# birds = ['crow', 'finch', 'hawk', 'eagle']


# def types(birds)
#   yield(birds)
# end

# types(birds) do |_, _, *birds_of_prey|
#   puts "Two birds of prey are the #{birds_of_prey.join(' and ')}."
# end

# 5.

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# a.

# gather(items) do |*produce, wheat|
#   puts produce.join(', ')
#   puts wheat
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# b.

# gather(items) do |apples, *produce, wheat|
#   puts apples
#   puts produce.join(', ')
#   puts wheat
# end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# c.

# gather(items) do |apples, *food|
#   puts apples
#   puts food.join(', ')
# end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# d.

# gather(items) do |apples, corn, cabbage, wheat|
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
# end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

# 6.

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}" }
# my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# looks like there's two different ways of defining a lambda
# a lambda is strict with the arguments passed in, while proc is not
# (if you call the lambda block with the wrong # of arguments,
# it will throw an error.  while a proc will not)

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# a block is also lax with the number of arguments passed in.
# it will not complain when you call it with the wrong number of errors.
# but you can't yield inside a method if no block was passed during invocation

# Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { |animal| puts "This is a #{animal}."}

# this seems to illustrate that it will be fine as long as the variables
# in the block are also block parameters, EVEN IF those parameters
# were not appropriately passed in.

# 7.

# puts "Group 1"

# def check_return_with_proc
#   my_proc = proc { return }
#   my_proc.call
#   puts "This will never output to screen."
# end

# check_return_with_proc

# a proc which contains a return and is within the method
# seems to exit out of the method when executed

# puts "Group 2"
# my_proc = proc { return }

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# check_return_with_proc_2(my_proc)

# if the proc is outside the method, the return within
# the proc prompts an error

# puts "Group 3"
# def check_return_with_lambda
#   my_lambda = lambda { return }
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda

# conversely, when a lambda has a return and is within the method,
# the rest of the code in the method is still executed
# so the return only exits out of the lambda?

# puts "Group 4"
# my_lambda = lambda { return }
# def check_return_with_lambda(my_lambda)
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda(my_lambda)

# also conversely, if the lambda contains a return and is outside the method,
# the rest of the code still executes find.  this seems to be because
# the return only exits out of the lambda block and not anything beyond that.

# Group 5
# def block_method_3
#   yield
# end

# block_method_3 { return }

# a block which is passed in during method invocation and has a return,
# if yielded to, returns an error.

# 8.

def convert_to_base_8(n)
  n.method_name.method_name # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(argument).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8,10,12,14,16,33].map(&a_proc)

# => [10, 12, 14, 16, 20, 41]























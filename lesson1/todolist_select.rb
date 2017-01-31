# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.
class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  # ---- Adding to the list -----

  # rest of class needs implementation
  def <<(todo)
    raise TypeError, 'Can only add Todo objects' unless todo.instance_of?(Todo)
    todos << todo if todo.instance_of?(Todo)
    self
  end
  alias_method :add, :<<

  # ---- Interrogating the list -----

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  # ---- Retrieving an item in the list ----

  def item_at(index)
    todos.fetch(index)
  end

  # ---- Marking items in the list -----

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def done!
    todos.each_index { |index| mark_done_at(index) }
  end

  # ---- Deleting from the the list -----

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete_at(index) if item_at(index)
  end

  # ---- Outputting the list -----

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  # ---- Methods that utilize blocks -----

  def each
    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new('')
    each do |todo|
      list << todo if yield(todo)
    end
    list
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect

result = list.each do |todo|
  puts todo                   # calls Todo#to_s
end

p result
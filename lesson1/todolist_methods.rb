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

  # ---- Main methods that utilize blocks -----

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

  # ---- Even more methods that utilize blocks -----

  def find_by_title(str)
    select { |todo| todo.title == str }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

p list.find_by_title('go to gym')

list.mark_done_at(0)
puts list
p list.all_done
p list.all_not_done

list.mark_done('Clean room')
puts list

# list.mark_all_done
# puts list

# list.mark_all_undone
# puts list
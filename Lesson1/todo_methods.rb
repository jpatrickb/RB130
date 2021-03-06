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

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class != Todo
      raise TypeError, "Can only add Todo objects."
    end
    @todos << todo
  end

  def <<(todo)
      raise TypeError, "can only add Todo objects" unless todo.instance_of? Todo
    
    @todos << todo
  end
  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all? {|todo| todo.done?}
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete_at(item_at(index))
  end

  def to_s
    puts "---- Today's Todos ----"
    @todos.each do |todo|
      puts todo
    end
  end

  def each
    counter = 0
    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end
    self
  end

  def select
    result = TodoList.new('new_list')
    each do |todo|
      result << todo if yield(todo)
    end
    result
  end

  def find_by_title(title)
    select do |todo|
      todo.title == title
    end.first
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
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

# Hint: use either TodoList#each or TodoList#select for the implementation.

# TodoList Class	Description
# find_by_title	   takes a string as argument, and returns the first Todo object that matches the argument. Return nil if no todo is found.
# all_done	       returns new TodoList object containing only the done items
# all_not_done	   returns new TodoList object containing only the not done items
# mark_done	       takes a string as argument, and marks the first Todo object that matches the argument as done.
# mark_all_done	   mark every todo as done
# mark_all_undone	 mark every todo as not done

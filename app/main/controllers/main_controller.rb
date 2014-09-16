class MainController < ModelController
  def index
    # Add code for when the index view is loaded
  end

  def todos
    page._current_todo = store._items[params._index.to_i]
  end

  def about
    # Add code for when the about view is loaded
  end

  def mark_all
    set_all(_all_completed.cur)
  end

  def set_all(completed)
    store._items.each do |item|
      item._complete = completed
    end
  end


  def add_item
    store._items << _new_todos.cur
    self._new_todos = {}
  end

  def remove_item(item)
    store._items.delete(item)
  end

  private
    # the main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._controller and params._action values.
    def main_path
      params._controller.or('main') + "/" + params._action.or('index')
    end
end

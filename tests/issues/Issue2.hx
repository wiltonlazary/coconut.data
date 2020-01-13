package issues;

@:asserts
class Issue2 {
  public function new() {}

  public function test() {
    var todos = new TodoList();
    var selection = todos.annex.get(TodoSelection);
    asserts.assert(selection != null);
    asserts.assert(todos.annex.get(TodoSelection) == selection);
    return asserts.done();
  }
}

private typedef Todo = Record<{ done:Bool, description:String }>;

private class TodoList implements Model {
  @:observable var items:List<Todo> = @byDefault null;
  @:transition function add(description)
    return { items: items.append(new Todo({ done: false, description: description })) };
}

private class TodoSelection {
  public var todos:TodoList;
  public function new(todos) {
    this.todos = todos;
  }
}
// private class TodoSelection implements Model {
//   @:editable var filter:Todo->Bool = function (_) return true;
//   @:constant private var todos:TodoList;
//   @:computed var items:List<Todo> = todos.items.filter(function (item) return filter(item));
//   @:computed var total:Int = todos.items.length;
//   @:computed var selected:Int = items.length;
// }
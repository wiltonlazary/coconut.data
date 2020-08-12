package coconut.data.helpers;

class Annex<Target:Model> {

  var target:Target;
  var registry:Map<Dynamic, Dynamic>;

  public function new(target:Target) {
  	this.target = target;
    this.registry = cast new haxe.ds.ObjectMap();
  }

  @:noCompletion public function __doGet<A>(cls:Class<A>, fn:Target->A):A
    return switch registry[cls] {
      case null: registry[cls] = fn(target);
      case v: v;
    }

  public macro function get(ethis:Expr, cls:Expr);
}
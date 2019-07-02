
class Singleton{
  static let sharedInstance = Singleton()
  private init(){}
  var intVariable:Int = 0
}

let shared = Singleton.sharedInstance;
shared.intVariable = 100;

let shared2 = Singleton.sharedInstance;
print(#"\#(shared2.intVariable)"#)


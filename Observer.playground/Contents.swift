import Foundation //we will use NSMutableSet to simlify the logic and

protocol Listener{
  func onObserverNotify(message: String)
}

protocol Observer {
  func add(listener:Listener)
  func remove(listener:Listener)
  func notify(withMessage string:String)
}

class ObserverObject:Observer{
  private var listeners = NSMutableSet() // it should be Set<Listener>  and Listener must confirm to protocol "Hashable"
  func add(listener:Listener){
    listeners.add(listener)
  }
  func remove(listener:Listener){
    listeners.remove(listener)
  }
  func notify(withMessage string:String){
    for listener in listeners {
      (listener as! Listener).onObserverNotify(message :string)
    }
  }
  
  func onNewMessage(message :String){
    notify(withMessage: message);
  }
}

//========
let MessageServer:ObserverObject = ObserverObject()

//========
class SomeSignal: NSObject,Listener{
  var name:String!
  func onObserverNotify(message: String){
    print(#"\#(name!) get: \#(message)"#)
  }
  init(_ userName :String) {
    super.init()
    name = userName
    MessageServer.add(listener: self)
  }
}

//========
var User1 = SomeSignal("Ken");
var User2 = SomeSignal("Dave");
var User3 = SomeSignal("Veronika");
var User4 = SomeSignal("Kate");

//========
MessageServer.onNewMessage(message: "Hi all!")
MessageServer.onNewMessage(message: "How are you?")




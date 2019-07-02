/*
 Default iterator example
 Array has default implementation of
 - IteratorProtocol > makeIterator()
 - Sequence > next()

 */

//let nums = [1,2,3,4,5,6, "a", "cat"] as [Any]
//var iterator = nums.makeIterator()
//while let i = iterator.next() {
//  print(i)
//}

/*
 our iterator
 */

print(" ++++++++++++++++++++++++++++++++ ")

class Element {
  var currValue:Any
  var nextI:Element? = nil
  var index:Int = 0
  
  init(_ val:Any) {
    self.currValue = val
  }
  func next()->Element?{
    return self.nextI
  }
}

class ElementIterator {
  private var iterateCursor:Element? = nil
  init(_ el:Element) {
    iterateCursor = el
  }
  func next()->Element?{
    iterateCursor = iterateCursor?.next()
    return iterateCursor
  }
  func isEnd() -> Bool? {
    return iterateCursor?.next() == nil
  }
}

class ElementManager {
  private var last:Element?
  private var first:Element!
  var count:Int = 0
  
  init() {
    let el:Element = Element("head")
    self.first = el
    self.last = self.first
    count = 1
  }
  
  func add(_ el:Any) -> Bool {
    let el:Element = Element(el)
    el.index = count
    last?.nextI = el
    last = el
    if count == 1 {
      self.first.nextI = last
    }
    count+=1
    return true
  }
  
  func getIterator() ->ElementIterator {
    return ElementIterator(first)
  }
}





//======= T E S T ======

var collection1 = ElementManager()
collection1.add("1")
collection1.add(10)
collection1.add("a")
collection1.add(19.9)

var iter_test1 = collection1.getIterator()
while let i = iter_test1.next() {
  print(i.currValue)
}

print(" ++++++++++++++++++++++++++++++++ ")
var iter_test2 = collection1.getIterator()
while iter_test2.isEnd() == false {
  let i = iter_test2.next();
  print(i!.currValue)
}


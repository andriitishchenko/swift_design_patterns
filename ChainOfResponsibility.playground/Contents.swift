
/*
 Feeding Chain:
 
 carrot -> rabit -> fox -> lion -> crocodile
 
 test who can eat 51 point weight of food
 
 */

protocol FeedingChain{
  var name:String { get }
  var maxSacrifice:Int { get }
  var next:FeedingChain? { get set}
  func canEat(weight:Int)
}

class Food: FeedingChain{
  var name:String = ""
  var maxSacrifice:Int = 0
  var next:FeedingChain?
  func canEat(weight:Int){
    if maxSacrifice >= weight{
      print("\(name) eat")
    }
    else {
      next?.canEat(weight: weight)
    }
  }
  init(name:String, max_sacrifice:Int) {
    self.name = name
    self.maxSacrifice = max_sacrifice
  }
}


let carrot = Food(name: "carrot", max_sacrifice: 2)
let rabit = Food(name: "rabit", max_sacrifice: 20)
let fox = Food(name: "fox", max_sacrifice: 50)
let lion = Food(name: "lion", max_sacrifice: 100)
let crocodile = Food(name: "crocodile", max_sacrifice: 200)

/*
 This part must be done in Manager:
 build chain depends on max sacrifice
 arranged it manually to simplify
*/
carrot.next = rabit
rabit.next = fox
fox.next = lion
lion.next = crocodile
//
carrot.canEat(weight: 51)



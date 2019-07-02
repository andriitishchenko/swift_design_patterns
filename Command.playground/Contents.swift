
/*
 we must perform 3 actions for some pets
 - feed = increase happiness
 - walk = increase happiness
 - stress = reduce happiness
 */

//=====================
protocol Command{
  func execute()
}

//=====================
class Animal{
  var name:String!
  var happiness: Int{
    didSet{
      if happiness<0 {
        print("\(name!) : Game over")
      }
      else {
        print("\(name!) Happiness = \(happiness)")
      }
    }
  }
  init(_ aname: String, _ happiness: Int) {
    self.name = aname
    self.happiness = happiness
  }
}

//=====================
class Feed:Command{
  private var _animal:Animal
  init(_ animal:Animal) {
    self._animal = animal
  }
  func execute(){
    _animal.happiness+=20
  }
}

class Walk:Command{
  private var _animal:Animal
  init(_ animal:Animal) {
    self._animal = animal
  }
  func execute(){
    _animal.happiness+=15
  }
}

class Stress:Command{
  private var _animal:Animal
  init(_ animal:Animal) {
    self._animal = animal
  }
  func execute(){
    _animal.happiness-=30
  }
}

//=====================
class Feeder{
  func performActions(cmd:Command){
    cmd.execute()
  }
}

//======== TEST =============

let owner:Feeder = Feeder()

let a:Animal = Animal("Cat",100)
let b:Animal = Animal("Dog",80)
let c:Animal = Animal("Fish",50)

owner.performActions(cmd: Feed(a))
owner.performActions(cmd: Walk(b))
owner.performActions(cmd: Feed(c))
//vacation {
owner.performActions(cmd: Stress(c))
owner.performActions(cmd: Stress(c))
owner.performActions(cmd: Stress(c))
owner.performActions(cmd: Stress(a))
owner.performActions(cmd: Stress(b))
//vacation }

a.happiness
b.happiness
c.happiness







protocol Animal{
  init()
  func sound()
}

class cat:Animal{
  required init() {
    print("I am CAT")
  }
  func sound(){
    print("Mayy")
  }
}

class dog:Animal{
  required init() {
    print("I am DOG")
  }
  func sound(){
    print("Guff")
  }

}

struct AnimalFactory {
  static func getAnimal(_ animalType: Animal.Type) -> Animal {
    let obj = animalType.init()
    return obj
  }
}

var mydog = AnimalFactory.getAnimal(dog.self)
mydog.sound()

var mycat = AnimalFactory.getAnimal(cat.self)
mycat.sound()



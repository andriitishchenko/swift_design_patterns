protocol Animal{
  func sound()
}

protocol AnimalFctory{
  func getAnimal()->Animal
}

class cat:Animal{
  init() {
    print("I am CAT")
  }
  func sound(){
    print("Mayy")
  }
}

class dog:Animal{
  init() {
    print("I am DOG")
  }
  func sound(){
    print("Guff")
  }
  
}

struct CatFactory: AnimalFctory {
  func getAnimal() -> Animal {
    return cat()
  }
}
struct DogFactory: AnimalFctory {
  func getAnimal() -> Animal {
    return dog()
  }
}


let dogsFactory = DogFactory()
let mydog = dogsFactory.getAnimal()
mydog.sound()

let catsFactory = CatFactory()
let mycat = catsFactory.getAnimal()
mycat.sound()



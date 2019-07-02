
protocol Animal{
  func name()
}

protocol CatFamily:Animal{
}
protocol DogFamily:Animal{
}

protocol AnimalFctory{
  func getAnimal()->CatFamily
  func getAnimal()->DogFamily
}

struct HomeAnimals:AnimalFctory{
  func getAnimal()->CatFamily{
    return cat()
  }
  func getAnimal()->DogFamily{
    return dog()
  }
}

struct WildAnimals:AnimalFctory{
  func getAnimal()->CatFamily{
    return tiger()
  }
  func getAnimal()->DogFamily{
    return wolf()
  }
}

//=============
struct cat:CatFamily{
  func name(){
    print("Cat")
  }
}

struct dog:DogFamily{
  func name() {
    print("dog")
  }
}

struct tiger:CatFamily{
  func name(){
    print("Tiger")
  }
}

struct wolf:DogFamily{
  func name(){
    print("Wolf")
  }
}
//=============

let homeFactory = HomeAnimals()
let wildFactory = WildAnimals()

var a_cat:CatFamily = homeFactory.getAnimal()
a_cat.name()

a_cat = wildFactory.getAnimal()
a_cat.name()

var a_dog:DogFamily = homeFactory.getAnimal()
a_dog.name()

a_dog = wildFactory.getAnimal()
a_dog.name()




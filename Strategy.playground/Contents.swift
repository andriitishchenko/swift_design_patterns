/*
 Imagin we have a car with different fuel consumption when we
 setup one of engines
 - 1.4
 - 2.2
 and 2 sets of automotive rubber of different diameter
 - 15
 - 19
 
 Lets say,
 - fuel consumption = engine * weels_size
 */

protocol EngineBehaviour {
  func getCapacity()->Int;
}

protocol WheelsBehaviour {
  func getSize()->Int;
}
//====================//

struct Engine14: EngineBehaviour{
  func getCapacity()->Int{
    return 14;
  }
}

struct Engine22: EngineBehaviour{
  func getCapacity()->Int{
    return 22;
  }
}

struct Weels15:WheelsBehaviour{
  func getSize()->Int{
    return 15;
  }
}

struct Weels19:WheelsBehaviour{
  func getSize()->Int{
    return 19;
  }
}

//====================//

class vehicle{
  private var engine:EngineBehaviour!
  private var weels:WheelsBehaviour!
  init(engineCapacity:EngineBehaviour, weelsSize:WheelsBehaviour){
    self.engine = engineCapacity
    self.weels = weelsSize
  }
  func getFuel() -> Int {
    return self.weels.getSize() * self.engine.getCapacity()
  }
}


//====================//

var carSmart:vehicle = vehicle(engineCapacity: Engine14(), weelsSize: Weels15())
carSmart.getFuel()

var carFordMustang:vehicle = vehicle(engineCapacity: Engine22(), weelsSize: Weels19())
carFordMustang.getFuel()

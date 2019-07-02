
/*
 Crossing the street:
 - human
 - human with bike
 */

class BaseTemplate{
  final func crossTheStreet() {
    beforeCrossTheStreet()
    crossingTheStreet()
    afterCrossTheStreet()
    print("== D O N E ==")
  }
  func beforeCrossTheStreet(){
    preconditionFailure()
  }
  func crossingTheStreet(){
    preconditionFailure()
  }
  func afterCrossTheStreet(){
    print("Enjoy")
  }
}

class Human:BaseTemplate{
  private func lookAtLeft(){
    print("look at left")
  }
  private func lookAtRight(){
    print("look at right")
  }
  private func go(){
    print("cross the road")
  }
  
  override func beforeCrossTheStreet(){
    lookAtLeft()
    lookAtRight()
  }
  override func crossingTheStreet(){
    go()
  }
}

class HumanWithBike:BaseTemplate{
  override func beforeCrossTheStreet(){
    print("get off the bike")
    print("look at left")
    print("look at right")
  }
  override func crossingTheStreet(){
    print("cross the road with bike in hands")
  }
  override func afterCrossTheStreet(){
    print("get on the bike")
  }
}

// ===== TEST  ==========

let hmn = Human()
hmn.crossTheStreet()


let hmnWithBike = HumanWithBike()
hmnWithBike.crossTheStreet()



// ===== VERSION with PROTOCOL  ==========
protocol TemplateProtocol{
  func crossTheStreet()
  func beforeCrossTheStreet()
  func crossingTheStreet()
  func afterCrossTheStreet()
}

extension TemplateProtocol{
  func crossTheStreet(){
      print("== S T A R T ==")
      beforeCrossTheStreet()
      crossingTheStreet()
      afterCrossTheStreet()
      print("== D O N E ==")
  }
  func afterCrossTheStreet(){}
}

class Humanv2:TemplateProtocol{
  
  func beforeCrossTheStreet(){
    print("look at left")
    print("look at right")
  }
  func crossingTheStreet(){
    print("cross the road")
  }
}
// ===== TEST 2  ==========
let hmnV2 = Humanv2()
hmnV2.crossTheStreet()

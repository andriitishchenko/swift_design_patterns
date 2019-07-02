
/*
 we have 3 iPads :Pro, Mini, Mini4G
 we need calc the price, based on default iPad model
 */

protocol AppleDevice {
  func getDetails() -> String
  func getPrice() -> Double
}

class iPad:AppleDevice{
  func getDetails() -> String {
    return "iPad"
  }
  func getPrice() -> Double{
    return 100
  }
}

class iPadDecorator: AppleDevice{
  private var decorated:AppleDevice
  func getDetails() -> String {
    return decorated.getDetails()
  }
  func getPrice() -> Double{
    return decorated.getPrice()
  }
  required init(_ device:AppleDevice){
    self.decorated = device
  }
}

class iPadPRO:iPadDecorator{
  override func getDetails() -> String {
    return super.getDetails() + " PRO"
  }
  override func getPrice() -> Double{
    return super.getPrice() + 90
  }
  required init(_ device:AppleDevice){
    super.init(device)
  }
}

class iPadMini:iPadDecorator{
  override func getDetails() -> String {
    return super.getDetails() + " Mini"
  }
  override func getPrice() -> Double{
    return super.getPrice() + 10
  }
  required init(_ device:AppleDevice){
    super.init(device)
  }
}

class iPadMini4g:iPadMini{
  override func getDetails() -> String {
    return super.getDetails() + " 4g"
  }
  override func getPrice() -> Double{
    return super.getPrice() + 50
  }
//  required init(_ device:AppleDevice){
//    super.init(device)
//  }
}


var ipad1:AppleDevice = iPad()
ipad1.getDetails()
ipad1.getPrice()

ipad1 = iPadPRO(ipad1)
ipad1.getDetails()
ipad1.getPrice()

ipad1 = iPadMini(iPad())
ipad1.getDetails()
ipad1.getPrice()

ipad1 = iPadMini4g(iPad())
ipad1.getDetails()
ipad1.getPrice()

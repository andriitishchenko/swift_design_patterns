/*
 we need to use USA Plug in EU
 */
class EuroPlug{
  func pin_minus() -> String{
    return "-"
  }
  func pin_plus() -> String{
    return "+"
  }
}

class USAPlug{
  func usa_pin_minus() -> String{
    return "-"
  }
  func usa_pin_plus() -> String{
    return "+"
  }
  func usa_pin_ground() -> String{
    return "*"
  }
}
/*
Create an Adapter
*/
class universalPlug{
  var usaPlug:USAPlug
  
  init(usaPlug:USAPlug) {
    self.usaPlug = usaPlug
  }
  
  func pin_minus() -> String{
    return usaPlug.usa_pin_minus()
  }
  func pin_plus() -> String{
    return usaPlug.usa_pin_plus()
  }
}

let eu:EuroPlug = EuroPlug()
eu.pin_minus()
eu.pin_plus()


let usa:universalPlug = universalPlug(usaPlug:USAPlug())
usa.pin_minus()
usa.pin_plus()


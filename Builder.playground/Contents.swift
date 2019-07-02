
protocol MedicalCardProtocol{
  var first_name:String { get }
  var last_name: String { get }
  var birthday:  Int { get }
}

protocol MedicalCardBuilderProtocol{
  func setFirst_name(_ value:String)
  func setLast_name(_ value:String)
  func setBirthday(_ value:Int)
  
  func CreateCard() -> MedicalCardProtocol?
  
}

struct MedicalCard:MedicalCardProtocol{
  var first_name:String
  var last_name: String
  var birthday:  Int
  init(first_name:String,
       last_name: String,
       birthday:  Int) {
    self.birthday = birthday
    self.first_name = first_name
    self.last_name = last_name
  }
}

class MedicalCardBuilder: MedicalCardBuilderProtocol{
  private var first_name:String?
  private var last_name: String?
  private var birthday:  Int?
  
  func setFirst_name(_ value:String){
    self.first_name = value
  }
  func setLast_name(_ value:String){
    self.last_name = value
  }
  func setBirthday(_ value:Int){
    self.birthday = value
  }
  
  func CreateCard() -> MedicalCardProtocol?{
    guard
      let fname = first_name,
      let lname = last_name,
      let bday = birthday
    else { return nil }
    return MedicalCard(first_name: fname, last_name: lname, birthday: bday)
  }
}

//============== TEST

let smplBuilder = MedicalCardBuilder()
smplBuilder.setFirst_name("Barbara")
smplBuilder.setLast_name("Streisand")

let instance = smplBuilder.CreateCard()


smplBuilder.setBirthday(1942)
let instance2 = smplBuilder.CreateCard()





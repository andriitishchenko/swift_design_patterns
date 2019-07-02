protocol menuItem {
  var level:Int { get }
  var title:String { get }
  func add(submenu: menuItem)
  func prints()
}

class item: menuItem {
  var level:Int
  var title:String
  private var submenus = [menuItem]()
  
  init(level: Int, title: String) {
    self.level = level
    self.title = title
  }
  
  func add(submenu: menuItem){
    self.submenus.append(submenu)
  }
  
  func prints(){
    var separ = " "
    for _ in 0...level {
      separ += "\t"
    }
    print(level,title , separator:separ)
    submenus.forEach{ $0.prints() }
  }
}



//======== TEST ===========

var menu = item(level: 0, title: "Root Menu")
var menu1 = item(level: 1, title: "File")
var menu2 = item(level: 1, title: "Edit")
var menu3 = item(level: 1, title: "Help")

var menu1_1 = item(level: 2, title: "New File")
var menu1_2 = item(level: 2, title: "Save")
var menu1_3 = item(level: 2, title: "Quit")

var menu3_1 = item(level: 2, title: "Documentation")
var menu3_2 = item(level: 2, title: "About")
var menu3_3 = item(level: 2, title: "Search")

var menu3_2_1 = item(level: 3, title: "Open in browser")

menu.add(submenu: menu1)
  menu1.add(submenu: menu1_1)
  menu1.add(submenu: menu1_2)
  menu1.add(submenu: menu1_3)
menu.add(submenu: menu2)
  menu3.add(submenu: menu3_1)
  menu3.add(submenu: menu3_2)
    menu3_3.add(submenu: menu3_2_1)
  menu3.add(submenu: menu3_3)
menu.add(submenu: menu3)

menu.prints()




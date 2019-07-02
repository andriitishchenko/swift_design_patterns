
protocol BacteriaState{
  func eat(bact:Bacteria)
  func move(bact:Bacteria)
  func die(bact:Bacteria)
}

struct Eat:BacteriaState{
  func eat(bact:Bacteria){
    print("eating already")
  }
  func move(bact:Bacteria){
    print("started to move")
    bact.setState(Move())
  }
  func die(bact:Bacteria){
    print("started to die")
    bact.setState(Die())
  }
}

struct Move:BacteriaState{
  func eat(bact:Bacteria){
    print("started to eat")
    bact.setState(Eat())
  }
  func move(bact:Bacteria){
    print("moving already")
  }
  func die(bact:Bacteria){
    print("started to die")
    bact.setState(Die())
  }
}

struct Die:BacteriaState{
  func eat(bact:Bacteria){
    print("Dead bacteria cannot eat")
  }
  func move(bact:Bacteria){
    print("Dead bacteria cannot move")
  }
  func die(bact:Bacteria){
    print("Dead bacteria cannot die")
  }
}



class Bacteria {
  private var state:BacteriaState
  func setState(_ state : BacteriaState) {
    self.state = state;
  }
  init() {
    state = Eat()
  }
  
  func do_eat(){
    state.eat(bact: self)
  }
  func do_move(){
    state.move(bact: self)
  }
  func do_die(){
    state.die(bact: self)
  }
}

//=========== TEST

let bacteria = Bacteria()

bacteria.do_eat()
bacteria.do_eat()
bacteria.do_move()
bacteria.do_move()
bacteria.do_eat()

bacteria.do_die()
bacteria.do_eat()
bacteria.do_move()
bacteria.do_die()

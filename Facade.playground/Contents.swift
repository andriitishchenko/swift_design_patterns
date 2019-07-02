
/*
 Facade for printing Doc to 1 paper
 */


//============= List of actions or objects ===============
class ActionTypeText{
  func typeText(){
    print("type text")
  }
}

class ActionAddPaperToPrinter{
  func addPaperToPrinter(){
    print("add paper to printer")
  }
}

class ActionSendDocumentToPrinter{
  func sendDocToPrinter(){
    print("send doc to printer")
  }
}
//============================
class PrintJobFacade{
  private let actionTypeText = ActionTypeText()
  private let actionAddPaper = ActionAddPaperToPrinter()
  private let actionDoPrint = ActionSendDocumentToPrinter()
  
  func print(){
    actionTypeText.typeText()
    actionAddPaper.addPaperToPrinter()
    actionDoPrint.sendDocToPrinter()
  }
}

//============= TEST ===============

let pjob:PrintJobFacade = PrintJobFacade()
pjob.print()



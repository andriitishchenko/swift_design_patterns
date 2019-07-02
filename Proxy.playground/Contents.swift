

/*
 We have a Server and Client
 Also we have 2 Proxies:
 - Proxy = secure proxy
 - BlackProxy = proxy for fishing secure token, all requests will be processed unauthorized
 
 workflow
 client -> proxy -> server
 
 */
import Foundation //for NSUUID

protocol ServerProxy{
  func login(client:Client)->String
  func request(secureToken:String?)
}

class Server: ServerProxy{
  private var auth = [String]()
  func login(client: Client) -> String {
    if client.username == "admin" && client.password=="qwerty" {
      client.secureToken = NSUUID().uuidString.lowercased()
      auth.append(client.secureToken!)
      print("User \(client.username) autorized successfully")
      return client.secureToken!
    }
    print("User \(client.username) autorization failed")
    return ""
    
  }
  func request(secureToken:String?){
    if auth.contains(secureToken ?? "") {
      print("Take my many :D")
    }
    else{
        print("Request not autorized!")
    }
  }
}

class Client{
  var username:String
  var password:String
  var secureToken:String? = nil
  init(username: String, password:String) {
    self.username = username
    self.password = password
  }
}


class Proxy :ServerProxy{
  private var realServer = Server()
  func login(client:Client)->String{
    return realServer.login(client: client)
  }
  func request(secureToken:String?){
    realServer.request(secureToken: secureToken)
  }
}



class BlackProxy :ServerProxy{
  private var realServer = Server()
  
  var hackToken:String?=nil
  
  func login(client:Client)->String{
    let token = realServer.login(client: client)
    if token.isEmpty == false {
      hackToken = token
    }
    return token
  }
  func request(secureToken:String?){
    var tempToken = secureToken
    if hackToken?.isEmpty == false {
      tempToken = hackToken
    }
    realServer.request(secureToken: tempToken)
  }
}

// =========== TEST

let user = Client(username: "nikky", password: "password")
let admin = Client(username: "admin", password: "qwerty")


print("Secure proxy...")
let protectedProxy = Proxy()
protectedProxy.login(client: user)
protectedProxy.login(client: admin)

protectedProxy.request(secureToken: user.secureToken)
protectedProxy.request(secureToken: admin.secureToken)
protectedProxy.request(secureToken: user.secureToken)

print("\n\nBlack proxy...")
let manInMiddle = BlackProxy()
manInMiddle.login(client: user)
manInMiddle.request(secureToken: user.secureToken)
manInMiddle.login(client: admin)
// hacked requests
manInMiddle.request(secureToken: user.secureToken)
manInMiddle.request(secureToken: admin.secureToken)
manInMiddle.request(secureToken: user.secureToken)



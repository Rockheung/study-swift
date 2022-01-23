
func sayHello(name: String) -> Void {
  print("Hello \(name)")
}

func sayHello(name: String...) -> Void {
    print(type(of: name))
    print(name, separator: "&")
}


func sayHello(name: Int...) -> Void {
    print(type(of: name))
    print(name, separator: "&")
}


sayHello(name: "John")
// Swift에서는 예쁘게 배열을 펼쳐주는 그런건 안되는 듯.
sayHello(name: "hello", "jo")
sayHello(name: 3,5,2,9)

print("a", "b", "c", separator: "-", terminator: "\n\n\n")

type(of: print)

//
//func printA (a: Int) {
//  a = 7 // error
//}


func alterA (a: inout Int) {
  a = 7 // error: cannot assign to value: 'a' is a 'let' constant
  print(a)
}

var nine = 9
let eight = 8

alterA(a: &nine)

print(nine)


alterA(a: &eight)
alterA(a: &123) // literal 값도 안됨

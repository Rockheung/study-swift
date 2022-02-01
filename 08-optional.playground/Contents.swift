var n : Int?

print(n)

var m : Int

//print(m)


type(of: n)
type(of: m)
n = 10
type(of: n!)
var o : Int? = 88
 

// n + o
n! + o!

var optI: Int? = 10

print(optI!)

if optI != nil {
    print(optI!)
}

// optional binding
// 옵셔널 표현식이 j라는 상수에 담긴다면.
// var j도 상관없으나 딱히 필요한 경우가 잘 없다
if let j = optI {
    print(j)
}

func unwrappI () {
    guard let j = optI else { return }
    print(j)
}

// Nil-Coalescing(Nil 병합 연산) - 코얼레싱
print(optI ?? 0)

// Nil-Coalescing & 삼항연산
print(optI != nil ? optI! : 0)

class Dog {
    var name: String?
    var age: Int?
    func bark() {
        print("Bark!")
    }
}

let foo: Dog? = nil
foo?.bark()



func sayHi(_ name: String, age: Int? = nil) {
  print("Hi, \(name).")
  if let _age = age {
    print("You might be \(_age), right?")
  }
}

sayHi("John") // Hi, John.
sayHi("Tom", age: 100) // Hi, Tom.\nYou might be 100, right?

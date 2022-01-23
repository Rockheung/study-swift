var a = 8
var x = "e", y = 7

// 실행은 되나 관행적으로 camelCase
var Thalle = 9


let age = 29

//age = 30


print("Thalle \(a)")

print("Thalle \(age)")


type(of: age)
print(type(of: a))
print(type(of: x))

print(Int.random(in: 3...3))


if (3 < 4) {
  print("Too small")
} else if (4 < 5) {
  print("Too big")
} else {
  print("Say ye")
}


switch Int.random(in: 1...100) {
  case let x where x % 3 == 0 :
    print("3 mul\(x)")
  case 1...20 :
    print ("1~20")
  case 21...40 :
    print ("21~40")
  case 41...60 :
    break
  case ...89 :
    print("big")
  case ..<100 :
    print("big")
  default :
    break
}


for a in 1...20 {
  print(a)
}

print(type(of: (1...10).reversed())) // -> ClosedRange
type(of: 1...) // -> PartialRangeFrom

type(of: ..<1) // -> PartialRangeUpTo<Int>
type(of: ...4) // -> PartialRangeThrough
type(of: stride(from: 3, to: 9, by: 2)) // -> StrideTo<Int>

print(stride(from: 3, to: 9, by: 2))

for x in stride(from: 3, to: 9, by: 2) {
  print(x)
}


var r = (5,7,"오이")
print(r.1, r.0, r)

type(of: r)


var s = (age: 6, 4)
type(of: s)


var (_age, child) = s
print(child, _age)

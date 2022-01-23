# Swift

## Variable(var) and Constant(let)

```swift
var a = 8
var x = "e", y = 7

// 실행은 되나 관행적으로 camelCase
var Thalle = 9

// constant
let age = 29

age = 30 // Cannot assign to value: 'age' is a 'let' constant
```


## String Interpolation

```swift
var name = "Rock"
print("My name is \(name)")
```


## Data Type

```swift
// Int <= 9,223,372,036,854,775,807
var n: Int = 9
// 4 bytes, 전체 6자리
var i: Float = 8.93522
// 8 bytes, 전체 15자리
var di: Double = 8.9999999
// 한 글자
var c: Character = "4", space = " "
// 문자열
var s: String = "Hello", empty = ""
// 참거짓
var b: Boolean = true
// Other: UInt, UInt64, Int32
```

## Type Checking

```swift
// 타입 확인
print(type(of: s))  // -> String
```


## Type Conversion

```swift
// 타입 변환: 데이터가 손실될 수 있으니 주의
Int("123") // 123
Int("Hello") // nil <- 변환에 실패
Int(123.45) // 123 <- 소수 버림
```

## Type Alias

```swift
typealias Name = String
```

## Random

```swift
Int.random(in: 1...100)
```

## Condition

```swift
// If
if num < 4 {
  print("Too small")
} else if {
  print("Too big")
} else {
  print("Say ye")
}
```

Switch 조건에 패턴 매칭을 쓸 수 있다.

```swift
switch Int.random(in: 1...100) {
  // x 에 바인딩
  case let x where x % 3 == 0 :
    print("3 mul")
  case 1...20 :
    print ("1~20")
  case 21...40 :
    print ("21~40")
  case 41...60 :
    break
  case 61...99 :
    print("big")
  default :
    break
}
```

## Pattern Matching
```swift
패턴 매칭 연산자 ~=
1...4 ~= y
// 1 이상 9 이하
1...9
// 2 이상
2...
// 8 이하
...9
// 10 미만
..<10
```

## 삼항연산자
```swift
var name = 7 > a ? "유치원" : "초등학생"
```


## Range Type
Range type(ex: 3...20) 은 오름차순만 가능. reversed()를 이용하여 내림차순 사용 가능

```swift
type(of: 1...10) // -> ClosedRange<Int>
type(of: 1...) // -> PartialRangeFrom<Int>
type(of: ...4) // -> PartialRangeThrough<Int>
type(of: ..<1) // -> PartialRangeUpTo<Int> 1 미만
type(of: (1...10).reversed()) // -> ReversedCollection<ClosedRange<Int>>
type(of: stride(from: 3, to: 9, by: 2)) // -> StrideTo<Int>
```

## Tuple
```swift
var r = (5,7,"오이")
print(r.1) // -> 7


// Named Tuple
var s = (age: 4, 4)
type(of: s)
print(s.age, s.1)

// Decomposition
var (age, child) = s
print(child)


// Tuple with Switch
var coordinate = (9, 0)
switch coordinate {
  case (let d, 0), (0, let d):
    print(d)
  default:
    print("Not on X-Axis or Y-Axis")
}
```

## Loop

### for
```swift
// let a, 기본적으로 변경 불가능
for a in 1...20 {
  print(a)
}

// 일부러 y를 변경 가능하게 선언, 그러나 곧 없어질 예정.
for var y in 3...10 {
  if y % 3 == 0 {
    y = 3
    print(y)
    continue
  }
  print y
}
/*
3
4
5
3
7
8
3
10
*/

for char in "Hello" {
  print(char)
}
/*
H
e
l
l
o
*/

for what in ["apple" ,"banana"] {
  print(what)
}
/*
apple
banana
*/

// wild card pattern
for _ in 4...20 {
  // print(_) -> error: '_' can only appear in a pattern or on the left side of an assignment
  print("hello")
}
```

### while
```swift
while 5 > 2 {
  print("5 is bigger then 2")
}

var i: Int = 0
repeat {
  print(i)
  i += 1
} while i < 4
```

### continue, break

loop 내부에서 해당 턴을 통과하고 계속할지(continue), 아니면 반복을 완전히 종료할지(break) 제어.
switch문에서의 break와는 조금 다름


## Labeled Statements

특정 Loop에 라벨을 붙여 제어할 수 있음.

```swift
LOOP_1: for i in 2...10 {
  LOOP_2: for j in 1...9 {
    if i == 10 {
      break LOOP_1
    }
    print("\(i) x \(j) = \(i*j)")
  }
}
```


## Function
```swift
func sayHello(name: String)  -> Void {
  print("Hello \(name)")
}

// print(items: Any..., separator: String, terminator: String)
print("a", "b", "c", separator: "??", terminator: "\n\n\n")

// overloading
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
// 알아서 Arguments에 맞는 함수를 실행한다.
sayHello(name: "hello", "jo")
sayHello(name: 3,5,2,9)
```


```swift
func printA (a: Int) {
  a = 7 // error: cannot assign to value: 'a' is a 'let' constant
}

func alterA (a: inout Int) {
  a = 7 // error: cannot assign to value: 'a' is a 'let' constant
  print(a)
}

var nine = 9
let eight = 8

alterA(a: &nine) // 원본을 전달한다는 &

print(nine) // 7
alterA(a: &eight) // error: cannot pass immutable value as inout argument: 'eight' is a 'let' constant
alterA(a: &123) // error: cannot pass immutable value as inout argument: literals are not mutable

```


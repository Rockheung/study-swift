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

패턴 매칭 연산자 `~=`

```swift
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
func sayHello(_ name: String...) -> Void {
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

### inout

내부적으로는 `copy-in copy-out`매커니즘으로 복사는 동일하게 되나
사용하는 우린 그냥 마치 reference가 전달되는 것 처럼 이해하고 쓰면 된다.

```swift
func printA (a: Int) {
  a = 7 // error: cannot assign to value: 'a' is a 'let' constant
}

func alterA (a: inout Int) {
  a = 7
}

var nine = 9
let eight = 8

alterA(a: &nine) // 원본을 전달한다는 &

print(nine) // 7
alterA(a: &eight) // error: cannot pass immutable value as inout argument: 'eight' is a 'let' constant
alterA(a: &123) // error: cannot pass immutable value as inout argument: literals are not mutable
// 가변파라미터(:여러개의 파라미터)로 선언된 것도 inout 키워드 쓸 수 없다.
```

### guard

예외처리 분기를 짤 때, 예외 상황이 발생할 경우 early exit - `else { return }` 구문을 강제하는 정도인 듯 하다.

```swift
func ifLogic (a: Int) {
    if 5 > a {
        print("Do true stuff")
    } else {
        print("Never be here")
    }
}

func guardLogic (a: Int) {
    guard 5 > a else {
        print("Never be here")
        return
    }
    print("Do true stuff")
}

guardLogic(a: 6)
ifLogic(a: 6)
```

### `@discardableResult`

함수의 결과값이 있다면, CPU 제어권도 그 결과를 받아야 하기 때문에 따라다니게 된다. 항상 결과값이 있게 됨.

`@attribute`키워드로 함수나 타입에 추가적인 속성을 정의할 수 있다.`@discardableResult`도 그중 하나. 몇개 없긴 함.

컴파일러에게 해당 함수의 결과값을 무시해라~ 하는 목적

```swift
@discardableResult // swift 5.2 부터 아래 경고를 없애기 위해 컴파일러한테 알려주는 attribute
func returnSome () {
  return "hi"
}

returnSome() // 'returnSome()' is unused ~ 경고가 뜸

_ = returnSome() // swift 5.2 전까지 사용하던 클래식한 방식
```

## Optional Type

```swift
var n : Int?
print(n) // warning: Expression implicitly coerced from 'Int?' to 'Any'

var m : Int
print(m) // error: Variable 'm' used before being initialized


type(of: n) // Optional<Int>
type(of: m) // Int
n = 10
type(of: n!) // Int


n + o // error: Binary operator '+' cannot be applied to two 'Int?' operands
n! + o!

```

### unwrapping

```swift
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

func unwrap () {
    guard let j = optI else { return }
    print(j)
}

// Nil-Coalescing(Nil 병합 연산) - 코얼레싱
print(optI ?? 0)

// Nil-Coalescing & 삼항연산
print(optI != nil ? optI! : 0)
```

### optional chaining

```swift
class Dog {
    var name: String?
    var age: Int?
    func bark() {
        print("Bark!")
    }
}

let foo: Dog? = nil
foo?.bark() // nil
```

### IUO(Implicitly Unwrapped Optionals) Type

nil을 할당할 수도 있지만(문법적으로) 로직상 값이 nil이 아님을 확신할 때에 사용
스토리보드와 Outlet 연결시 주로 사용

```swift
var userAge: Int! = 1
```

### optional parameter

```swift
func sayHi(_ name: String, age: Int? = nil) {
    print("Hi, \(name).")
    if let _age = age {
        print("You might be \(_age), right?")
    }
}

sayHi("John") // Hi, John.
sayHi("Tom", age: 100) // Hi, Tom.\nYou might be 100, right?
```


## Collection

- Array, Dictionary, Set

### Array

- method
    - subscript (ex: `arr[9]`)
        - `arr[arr.startIndex]` 
        - `arr[arr.lastIndex - 1]` 
        - `arr[arr.index(i: 2, offsetBy: 3)]`
        - `arr[0...2]`
        - `arr(0...2, with: [4,1,2])` ~ `arr[0...2] = [4,1,2]`
    - `count`
    - `isEmpty`
    - `contains(7)`
    - `randomElements("Hi")`
    - `swapAt(0,1)`
    - `first`
    - `last`
    - `startIndex`
    - `endIndex`
    - `firstIndex(of: )`
    - `lastIndex(of: )`
    - `removeAll(keepingCapacity: Bool)`

    - `sort()` ~ 원본을 변경시킴
    - `sorted()` ~ 새로운 배열을 리턴함
    - `reverse()`
    - `reversed()`
    - `shuffle()`
    - `shuffled()`

    - `arr1 ~= arr2`

```swift
if let foundIdx = arr.lastIndex(of: 4) {
    arr.remove(at: foundIdx)
}

if !arr.isEmpty {
    print("\(arr.count)")
}
```

```swift
for item in arr.enumerated() {
    // named tuple로 튀어나온다
    print("\(item.0): \(item.1)")
}

for (offset, element) in arr.enumerated() {
    print("\(offset): \(element)")
}

for (offset, element) in arr.enumerated().reversed() {
    print("\(offset): \(element)")
}
```

### Dictionary

- Hashable?
어떤 타입이 Hash Function에 넣을 수 있다, 그러니까 같은 input에 항상 같은 output이 나온다는 뜻. Swift에서는 기본타입이 모두 Hashable.

- Dictionary의 키값은 Hashable한 값만 사용 가능함.

- 순서가 없다! 출력할때마다 순서가 지멋대로인 점 주의

```swift
let dic: Dictionary<Int, String> = [0: "5", 9: "Cloud"]
print(dic) // [0: "5", 9: "Cloud"]

let dicEmpty: Dictionary<Int, String> = [:]
let dicEmpty2 = Dictionary<Int, String>()
let dicEmpty3 = [Int: String]()

// all true
dicEmpty == dicEmpty2
dicEmpty2 == dicEmpty3
dicEmpty == dicEmpty3
```

- method
    - subscript (ex: `dic["A"]`)
        - Optional
        - `dic["one", default: 1]` nil 방지됨
        - `dic["A"] = nil` A 키가 삭제됨
    - `randomElement`
    - `keys`
    - `values`
    - `count`
    - `isEmpty`
    - `update`
    - `remove`
    - `updateValue` : upsert(update & insert). 기존 값을 반환
    - `removeValue`

- 중첩

값이 Array

```swift
var dic = [String: [String]]()
dic["A"] = ["1", "2"]
```

값이 Dictionary

```swift
var dic = [String: [String: Int]]()
dic["A"] = ["1": 1, "2": 2]
```

- 반복문과

enumerate 필요 없다. 한 쪽을 안  쓰려면 `_`활용
```swift 
for (key, value) in dic {
    print("\(key)" : "\(value)"
}
```


### Set

Hashable. 정렬 속도 < 검색 속도 인 경우에 사용할 수 있음. 
부분집합, 상위집합, 서로소 같은 개념을 사용할 수 있다.

```swift
let emptySet: Set<Int> = []
let emptySet2: Set<Int>()
````

- method
    - subscript 구문은 없다.
    - `count`
    - `isEmpty`
    - `contains()`
    - `randomElement()`
    - `update()`
    - `remove()`
    - `b.isSubset(of: a)` - 부분집합
    - `b.isStrictSubset(of: a)` - 진부분집합
    - `a.isSuperset(of: b)` - 상위집합
    - `a.isStrictSuperset(of: b)` - 진상위집합
    - `a.isDisjoint(with: c)` - 서로소
    - `a.union(c)` - 합집합
    - `a.formUnion(c)` - 합집합, 원본 변형시킴
    - `a.intersection(b)` - 교집합
    - `a.subtracting(b)`- 차집합
    - `a.symmetricDifference(b) - 대칭자집합
    - `a.formSymmetricDifference(b) - 대칭자집합 - 원본 변경
    - `a.sorted()` -> 배열이 튀낭옴

```swift
let nums: Set<Int> = [5,7,3,6,9]
for num in nums {
    print(num)
}
```


## Collection 관련 이론

method 패턴에서 mutable \ immutable 여부를 유추 가능.
동사형이면 mutable, 분사형이면 immutable로 간주 가능


### Foundation Collection - Objective-C

- Class \ Object Type
    - NSArray \ NSMutableArray
    - NSDictionary \ NSMutableDictionary
    - NSSet \ NSMutableSet


### `KeyValuePairs`: 순서가 있는 컬렉션
key가 Hashable할 필요 없음. 최근에 만든 임시적 개념


### Copy-On-Write 최적화

코드상에서 값을 복사해서 담는다 해도 실제 값이 바뀌기 전까지는 그냥 하나의 메모리에 담아서 사용할 수도 있다.


## 열거형(Enumeration)

소문자!

```swift
enum Day {
    case mon
    case tue
    case wed
    case thu
    case fri
    case sat
    case sun
}

var day = Day.mon
// 타입을 지정해주면 이렇게 할당 가능
var day2: Day = .mon
```

열거형은 무조건 Switch문으로 처리한다고 생각해도 무방.


### 열거형의 원시값과 연관값

- 원시값(Raw Value)

아래 Int, String 말고도 hashable하면 모두 사용 가능

```swift
enum Arrow: String {
    case up     // "up"
    case down   // "down"
    case left   // "left"
    case right  // "down"
}

enum Arrow2: Int {
    case up     // 0
    case down   // 1
    case left   // 2
    case right  // 3
}

var w: Arrow = .up
var w2 = Arrow(rawValue: "up")
var w3 = Arrow2(rawValue: 0)
```

- 연관값

구체적인 추가 정보를 저장하기 위해 사용, 카테고리를 만드는 거라 보면 된다
정보가 바뀔때 마다 무한대의 케이스를 만들고 싶을 때 사용한다

```swift
enum Computer {
    case cpu(Double)
    case ram(Int, String)
    case harddisk(tb: Int)
}
```

- 차이 (원시값 | 연관값)
    - 선언 형식: hashable key | tuple(내맘대로)
    - 저장 시점: 선언할 때 | 값을 생성할 때.
    - 같이 못 쓴다.


```swift
var com = Computer.cpu(4.5)
switch com {
    case .cpu(4.5):
        print("fast!")
    default: 
        print("dang...")
}
```

바인딩도 가능

```swift
var com = Computer.cpu(4.5)
switch com {
    case .cpu(let clock):
        print("\(clock)ghz, fast!")
    default: 
        print("dang...")
}

```

### Optional ~ 열거형(연관값)의 일종

```swift
// 이것이 정확한 구현이다.
enum Optional<Wrapped> {
    case some(Wrapped)
    case none
}

var num: Int? = 9

switch num {
case .none:
    print("none!")
case .some(let n):
    print("\(n)")
}

// 위 식을 아래처럼 사용할 수 았도록 해 놓은 것이다.
if let n = num {
    print("\(n)")
}


var num2: Optional<Int>
...
```

`.none`과 `nil`은 그래서 실은 전적으로 동일한 것.

### Switch문과의 조합과 편의기능

Optional Enum의 경우 두 번 벗겨야 하나, 한 번으로 벗기는 편의 기능을 제공.

```swift
enum SomeEnum {
    case left
    case right
}

let x: SomeEnum? = .left

switch x {
case some(let value):
    switch value {
    case .left:
        // Do left stuff
    case .right:
        // Do right stuff
    }
case .none:
    // Do nil stuff
}

// convenience way
switch x {
case .some(.left):
    // Do left stuff
case .some(.right):
    // Do right stuff
case .none:
    // Do nil stuff
}


// more convenience way
switch x {
case .left:
    // Do left stuff
case .right:
    // Do right stuff
case .nil:
    // Do nil stuff
}
```

열거형 case 패턴도 있다(`if case`, `for case`)

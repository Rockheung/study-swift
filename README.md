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
var c: Character = "4", s = " "
// 문자열
var s: String = "Hello"
```
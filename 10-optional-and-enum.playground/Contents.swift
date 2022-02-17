var num: Int? = 9

switch num {
case .none:
    print("none!")
case .some(let n):
    print("\(n)")
}


var num2: Optional<Int>

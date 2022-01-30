func randomChar (str: String) -> Character {
    let strLength = str.count
    let strArr = Array(str)
    let randomIdx = Int.random(in: 0..<strLength)
    return strArr[randomIdx]
}

randomChar(str: "234234")

// Answer on lecture
func randomCharAns (_ str: String) -> String {
    return String(str.randomElement()!)
}

randomCharAns("apple")


func isPrime(n: Int) -> Bool {
    guard n > 2 else {
        return n == 2
    }
    let sqrt_n = Int(Double(n).squareRoot())
    for i in 2...sqrt_n {
        if n % i == 0 {
            print("\(n) has \(i) as its divisor.")
            print("\(n) / \(i) = \(Int(n / i))")
            return false
        }
    }
    
    print("\(n) is prime number.")
    
    return true
}


isPrime(n: 0)

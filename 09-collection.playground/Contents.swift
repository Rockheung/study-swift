import UIKit

var greeting = "Hello, playground"


let dic: Dictionary<Int, String> = [0: "5", 9: "Cloud"]

print(dic)



let dicEmpty: Dictionary<Int, String> = [:]
let dicEmpty2 = Dictionary<Int, String>()
let dicEmpty3 = [Int: String]()

dicEmpty == dicEmpty2
dicEmpty2 == dicEmpty3
dicEmpty == dicEmpty3


type(of: dic[4, default: "7"])






let nums: Set<Int> = [5,7,3,6,9]
for num in nums {
    print(num)
}

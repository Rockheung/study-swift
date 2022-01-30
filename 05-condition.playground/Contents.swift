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


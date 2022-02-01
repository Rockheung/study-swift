func fac (_ n: Int) -> Int {
    guard n > 1 else { return 1 }
    return n * fac(n-1)
}

fac(3)

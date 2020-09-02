func solution(_ clothes:[[String]]) -> Int {
    
    var dic: [String:[String]] = [:]
    var result = 1
    
    clothes.forEach {
        var key = $0[1]
        var value = $0[0]
        
        if dic.keys.contains(key) {
            dic[key]?.append(value)
        }
        else {
            dic.updateValue([value], forKey: key)
        }
    }
    dic.forEach { (key, value) in
        result = result * (value.count + 1)
    }
    
    return result - 1
}

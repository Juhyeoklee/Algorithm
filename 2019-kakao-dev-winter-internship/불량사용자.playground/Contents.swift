import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var userID = user_id
    var answer = 1
    var count = 0
    var flag = true
    var check: [String : Bool] = [ : ]
    
    user_id.forEach {
        check.updateValue(false, forKey: $0)
    }
   
    for bUser in banned_id {
        count = 0
        
//        var isFind = false
        var lUser = ""
        for user in user_id {
            
            if check[user]! {
                continue
            }
            
            flag = true
            let bUserArr = Array(bUser)
            let userArr = Array(user)
            
            if bUser.count == user.count {
                for i in 0..<user.count {
                    if bUserArr[i] == "*" {
                        continue
                    }
                    
                    if bUserArr[i] != userArr[i] {
                        flag = false
                        break
                    }
                }
            }
            else {
                flag = false
            }
            
            if flag == true {
                lUser = user
                print(user, bUser)
                count += 1
            }
        }
        check.updateValue(true, forKey: lUser)
        
        answer *= count
    }
    print(check)
    
    return answer
}


//solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"])
//solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"])
solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"])

//var s = "frodo"
//
//
//var a = Array(s)
//print(a)


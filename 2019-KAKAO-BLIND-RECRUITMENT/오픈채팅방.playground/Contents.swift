import Foundation

struct User {
    var uid: String
    var nickName: String
}
struct Record {
    var uid: String
    var action: String
    
    var sentence: String?
    init(uid: String, action: String) {
        self.uid = uid
        self.action = action
        
        if action == "Enter" {
            self.sentence = "들어왔습니다."
        }
        else if action == "Leave" {
            self.sentence = "나갔습니다."
        }
        else {
            
        }
    }
    
    
}

func solution(_ record:[String]) -> [String] {
    
    var users: [String: String] = [:]
    var actions: [Record] = record.compactMap {
        
        let arr = $0.components(separatedBy: " ")
        let work = arr[0]
        let uid = arr[1]
        if work == "Enter" || work == "Leave" {
            if work == "Enter" {
                let nick = arr[2]
                users.updateValue(nick, forKey: uid)
            }
            return Record(uid: uid, action: work)
        }
        else {
            let nick = arr[2]
            users.updateValue(nick, forKey: uid)
            return nil
        }
    }
//    print(actions)
//    print(users)
//    print(actions.compactMap {
//
//        return "\(users[$0.uid]!)님이 " + $0.sentence!
//    })
    
    return actions.compactMap {
        return "\(users[$0.uid]!)님이 " + $0.sentence!
    }
    
}

solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])


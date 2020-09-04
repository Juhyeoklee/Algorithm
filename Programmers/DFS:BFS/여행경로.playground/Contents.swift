import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var visited: [Bool] = Array(repeating: false, count: tickets.count)
    var startPoint: String = "ICN"
    var route: [String] = []
    var answer: [String] = []
    var length: Int = 0

    let sortedTicket = tickets.sorted(by: { $0[1] < $1[1] })


    dfs(start: startPoint, length: 0, ticket: sortedTicket, visited: &visited, answer: &answer, route: &route)

    return answer
}

func dfs(start: String, length: Int, ticket: [[String]], visited: inout [Bool], answer: inout [String], route: inout [String]) {
    route.append(start)
    
    if length == ticket.count {
        answer = route
        return
    }
    
    for (i, t) in ticket.enumerated() where answer.isEmpty {
        if t[0] == start && !visited[i] {
            visited[i] = true
            dfs(start: t[1], length: length + 1, ticket: ticket, visited: &visited, answer: &answer, route: &route)
            visited[i] = false
        }
    }
    route.removeLast()
}


//solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]])
solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL", "SFO"]])


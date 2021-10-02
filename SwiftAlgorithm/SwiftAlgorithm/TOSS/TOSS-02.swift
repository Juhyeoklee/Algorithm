//
//  TOSS-02.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/08/14.
//

import Foundation

struct Transaction{
    enum TransactionType: String {
        case deposit = "deposit"
        case withdraw = "withdraw"
        case change = "change"
        case unrecognized = "unrecognized"
        
        var description: String {
            switch self {
            case .deposit:
                return "입금"
            case .withdraw:
                return "출금"
            default:
                return ""
            }
        }
    }
    var id: Int
    var type: TransactionType
    var name: String
    var price: Int
    
    var description: String {
        return "\(type.description) \(name) \(price)원"
    }
    
}
typealias TransactionPiar = (Int, Transaction)

func solution(_ actions:[String]) -> [String] {
    let transactions = actions.map { (toTransaction(action: $0)) }
    let dic = Dictionary(transactions) { first, second in
        return Transaction(id: first.id, type: first.type, name: second.name, price: second.price)
    }
    let history = dic.sorted { $0.key < $1.key}
        .map { $0.value}
        .filter { $0.type == .withdraw || $0.type == .deposit }
    let total = history.reduce(0) {
        if $1.type == .withdraw {
            return $0 - $1.price
        }
        return $0 + $1.price
    }
    return history.map { $0.description } + ["\(total)원"]
}

func toTransaction(action: String) -> TransactionPiar {
    let splitAction = action.components(separatedBy: " ")
    let transaction = Transaction(id: Int(splitAction[0])!,
                                  type: Transaction.TransactionType(rawValue: splitAction[1]) ?? .unrecognized,
                                  name: splitAction[2],
                                  price: Int(splitAction[3]) ?? 0)
    return (transaction.id, transaction)
}

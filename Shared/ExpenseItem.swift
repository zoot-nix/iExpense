//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Owais Shaikh on 28/07/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

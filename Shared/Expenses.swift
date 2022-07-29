//
//  Expenses.swift
//  iExpense
//
//  Created by Owais Shaikh on 28/07/22.
//

import Foundation

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem](){
        didSet{
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from:savedItems){
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

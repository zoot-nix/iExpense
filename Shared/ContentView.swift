//
//  ContentView.swift
//  Shared
//
//  Created by Owais Shaikh on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var ShowingAddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items, id:\.id){ item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code:"INR"))
                            .foregroundColor(Color.red)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                   ShowingAddExpense = true 
                }label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $ShowingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  SwiftUIPie
//
//  Created by David Li on 2024-01-28.
//

import SwiftUI
import SwiftData
import Charts

struct ContentView: View {
    private var coffeeSales = [
        (name: "Americano", count: 120),
        (name: "Cappuccino", count: 234),
        (name: "Espresso", count: 62),
        (name: "Latte", count: 625),
        (name: "Mocha", count: 320),
        (name: "Affogato", count: 50)
    ]

    var body: some View {
        Chart{
            ForEach(coffeeSales, id: \.name){ coffee in
                BarMark(
                    x: .value("Name", coffee.name),
                    y: .value("count", coffee.count)
                    )
                .foregroundStyle(by: .value("Type name", coffee.name))
                
            }
        }
        
        
    }

    
}

#Preview {
    ContentView()
}

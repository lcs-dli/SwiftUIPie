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
    @State private var selectedCount: Int?
    @State var selectedSector: String?
    
    var body: some View {
        Chart{
            ForEach(coffeeSales, id: \.name){ coffee in
                SectorMark(
                    angle: .value("count", coffee.count),
                    innerRadius: .ratio(0.65),
                    angularInset: 2.0
                    )
                .foregroundStyle(by: .value("Type name", coffee.name))
                .annotation(position: .overlay){
                    Text("\(coffee.count)")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .cornerRadius(10.0)
            }
        }
        .frame(height: 500)
        .chartBackground{ proxy in
            Text("☕")
                .font(.system(size: 100))
        }
        .chartAngleSelection(value: $selectedCount)
        .onChange(of: selectedCount){oldValue, newValue in
            if let newValue {
                selectedSector = findSelectedSector(value: newValue)
            }else{
                selectedSector = nil
            }
        }
        .opacity(selectedCount == nil ? 1.0 : (selectedSector == coffee.name ? 1.0 : 0.5))
        
        
    }
    private func findSelectedSector(value: Int) -> String?{
        var accumulatedCount = 0
        
        let coffee = coffeeSales.first{(_,count) in
            accumulatedCount += count
            return value<=accumulatedCount
        }
        
        return coffee?.name
    }
    
}

#Preview {
    ContentView()
}

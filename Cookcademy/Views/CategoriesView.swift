//
//  CategoriesView.swift
//  Cookcademy
//
//  Created by Juan Esteban Rozo Mendez on 17/02/25.
//

import SwiftUI

struct CategoriesView: View {
    let categories = MainInformation.Category.allCases
    let colors = [Color.red, Color.blue, Color.green, Color.yellow]
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                LazyVGrid(columns: layout, spacing: 0) {
                    ForEach(0..<4) { index in
                        Image("square.and.arrow.up")
                            .frame(
                                width: (geometry.size.width / 2) + 5,
                                height: geometry.size.height / 2)
                            .overlay(content: {
                                Text("\(categories[index].rawValue)")
                                    .font(.title)
                            })
                            .background(colors[index])
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    CategoriesView()
}

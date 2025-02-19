//
//  ContentView.swift
//  Cookcademy
//
//  Created by Juan Esteban Rozo Mendez on 13/02/25.
//

import SwiftUI

struct RecipesView: View {
    
    @State var recipesvm = RecipesViewModel()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        RecipeInfoView(recipe: recipe)
                    } label: {
                        RecipeRow(content: recipe.mainInformation.name)
                    }
                    .listRowBackground(listBackgroundColor)
                    .foregroundColor(listTextColor)
                }
            }
            .navigationTitle(navigationTitle)
            .listStyle(.plain)
        }
    }
}

extension RecipesView {
    var recipes: [Recipe] {
        recipesvm.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

struct RecipeRow: View {
    var content: String
    var body: some View {
        HStack {
            Image(systemName: "book.circle.fill")
            Text(content)
            Spacer()
        }
        .foregroundStyle(content.contains("Vegetarian") ? Color.green : Color.black)
    }
}

#Preview {
    RecipesView()
}

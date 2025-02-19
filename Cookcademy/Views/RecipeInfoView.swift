//
//  SwiftUIView.swift
//  Cookcademy
//
//  Created by Juan Esteban Rozo Mendez on 13/02/25.
//

import SwiftUI

struct RecipeInfoView: View {
    
    let recipe: Recipe
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Author: \(recipe.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text("\(recipe.mainInformation.description)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                            .foregroundColor(listTextColor)
                    }
                }.listRowBackground(listBackgroundColor)
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1). ").bold()
                            Text("\(direction.isOptional ? "(Optional) " : "")"
                                 + "\(direction.description)")
                        }.foregroundColor(listTextColor)
                    }
                }.listRowBackground(listBackgroundColor)
            }
            .listStyle(.plain)
            Spacer()
        }
        .navigationTitle(recipe.mainInformation.name)
        .padding()
    }
    
}

#Preview {
    RecipeInfoView(recipe: Recipe.testRecipes.first!)
}

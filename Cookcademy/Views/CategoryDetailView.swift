//
//  CategoryDetailView.swift
//  Cookcademy
//
//  Created by Juan Esteban Rozo Mendez on 19/02/25.
//

import SwiftUI

struct CategoryDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedCategory: String?
    var categoryRecipes: [Recipe]
    
    var body: some View {
        NavigationStack {
            if let imageName = selectedCategory {
                VStack(spacing: 10) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20.0)
                        .matchedGeometryEffect(id: imageName, in: namespace)
                    List {
                        Section() {
                            ForEach(categoryRecipes) { recipe in
                                NavigationLink {
                                    RecipeInfoView(recipe: recipe)
                                } label: {
                                    RecipeRow(content: recipe.mainInformation.name)
                                }
                                .listRowBackground(AppColor.background)
                                .foregroundColor(AppColor.foreground)
                            }
                        } header: {
                            Text("\(imageName) recipes")
                                .font(.headline)
                        }
                    }
                    .listStyle(.plain)
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedCategory = nil
                        }
                    }, label: {
                        Text("Close")
                            .foregroundStyle(.white)
                            .padding()
                            .background(
                                Capsule()
                                    .fill(.green)
                            )
                        
                    })
                    Spacer()
                }
                .frame(
                    width: 350,
                    height: 500
                )
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(
                            Color.white
                        )
                        .shadow(radius: 10)
                )
            }
        }
    }
}

#Preview {
    @Namespace var namespace
    return CategoryDetailView(namespace: namespace, selectedCategory: .constant("Breakfast"), categoryRecipes: Recipe.testRecipes)
}

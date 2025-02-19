//
//  CategoriesView.swift
//  Cookcademy
//
//  Created by Juan Esteban Rozo Mendez on 17/02/25.
//

import SwiftUI

struct RecipeCategoryView: View {
    @Namespace var namespace
    @State private var vm = RecipesViewModel()
    @State private var selectedCategory: String?
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            content
                .disabled(selectedCategory != nil)
                .ignoresSafeArea()
                .overlay(content: {
                    CategoryDetailView(
                        namespace: namespace,
                        selectedCategory: $selectedCategory,
                        categoryRecipes: vm.categoryRecipes
                    )
                })
        }
    }
    
    var content: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: layout, spacing: 0) {
                ForEach(vm.categories.keys.sorted(), id: \.self) { key in
                    if key != selectedCategory {
                        Image(key)
                            .resizable()
                            .interpolation(.high)
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                width: (geometry.size.width / 2) + 5,
                                height: geometry.size.height / 2
                            )
                            .clipped()
                            .opacity(vm.categories[key] ?? 0.8)
                            .contentShape(Rectangle())
                            .matchedGeometryEffect(id: key, in: namespace)
                            .onTapGesture {
                                vm.selectedCategory(with: key)
                                withAnimation(.spring(Spring(response: 0.5, dampingRatio: 0.7))) {
                                    selectedCategory = key
                                }
                            }
                    } else {
                        Color.clear
                            .frame(
                                width: (geometry.size.width / 2) + 5,
                                height: geometry.size.height / 2
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeCategoryView()
}

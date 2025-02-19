//
//  RecipesViewModel.swift
//  Cookcademy
//
//  Created by Juan Esteban Rozo Mendez on 14/02/25.
//

import Foundation
import SwiftUI

@Observable
class RecipesViewModel {
    
    var recipes = Recipe.testRecipes
    
    var categories = [String: Double]()
    var currentCategory: String {
        didSet {
            self.resetCategoryValues()
        }
    }
    var categoryRecipes: [Recipe] {
        let category = MainInformation.Category(rawValue: currentCategory)
        return recipes.filter { $0.mainInformation.category == category }
    }
    
    init() {
        self.currentCategory = ""
        for category in Recipe.categories {
            self.categories[category.rawValue] = 0.5
        }
    }
    
    func selectedCategory(with name: String) {
        self.currentCategory = name
        self.categories[name] = 1
    }
    
    private func resetCategoryValues() {
        for category in self.categories.keys {
            if category != currentCategory {
                self.categories[category] = 0.5
            }
        }
    }
    
}

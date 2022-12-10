//
//  DataManager.swift
//  TestShop
//
//  Created by Artem Pavlov on 09.12.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    func getCategories() -> [Category] {
        var categories: [Category] = []
        
        let phone = Category(name: "Phones", picture: "iphone")
        let computer = Category(name: "Computer", picture: "desktopcomputer")
        let health = Category(name: "Health", picture: "heart.text.square")
        let books = Category(name: "Books", picture: "books.vertical")
        let home = Category(name: "Home", picture: "house")
        let car = Category(name: "Car", picture: "car")
        let school = Category(name: "School", picture: "graduationcap")
        
        categories.append(phone)
        categories.append(computer)
        categories.append(health)
        categories.append(books)
        categories.append(home)
        categories.append(car)
        categories.append(school)
        
        return categories
    }
}

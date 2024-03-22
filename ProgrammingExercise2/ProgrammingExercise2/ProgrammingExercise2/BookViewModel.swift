//
//  BookDetailViewController.swift
//  ProgrammingExercise2
//
// Team Names
// Akanksh Jagadish - 885199208
// Pavan Pasumarthy - 885153056
// Yashas Kantharaj - 885154237
// Anshika Khandelwal - 885186288

import Foundation

class BookViewModel {
    var title: String?
    var author: String?
    var publicationYear: String?
    var image: String?
    
    init(title: String? = nil, author: String? = nil, publicationYear: String? = nil, image: String? = nil) {
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
        self.image = image
    }
}

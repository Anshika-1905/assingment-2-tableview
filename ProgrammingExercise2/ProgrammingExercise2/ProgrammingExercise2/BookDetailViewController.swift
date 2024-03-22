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
import UIKit

class BookDetailViewController: UIViewController {
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    var book: BookViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookName.text = book?.title
        year.text = "(\(book?.publicationYear ?? " No year of publication available"))"
        authorName.text = book?.author
        if let image = book?.image {
            bookImage.image = UIImage(named: image)
        } else { bookImage.isHidden = true }
    }
}

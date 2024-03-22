//
//  BooksViewController.swift
//  ProgrammingExercise2
//
// Team Names
// Akanksh Jagadish - 885199208
// Pavan Pasumarthy - 885153056
// Yashas Kantharaj - 885154237
// Anshika Khandelwal - 885186288

import UIKit

class BooksViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    var books: [BookViewModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        // Loading Data
        let book1 = BookViewModel(title: "Don Quixote", author: "Miguel de Cervantes", publicationYear: "1605", image: "Don Quixote")
        let book2 = BookViewModel(title: "Alice's Adventures in Wonderland", author: "Lewis Carroll", publicationYear: "1865", image: "Alice's Adventures in Wonderland")
        let book3 = BookViewModel(title: "The Adventures of Huckleberry Finn", author: "Mark Twain", publicationYear: "1884", image: "The Adventures of Huckleberry Finn")
        let book4 = BookViewModel(title: "The Adventures of Tom Sawyer", author: "Mark Twain", publicationYear: "1876", image: "The Adventures of Tom Sawyer")
        books = [book1, book2, book3, book4]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookDetailViewController {
            if let index = myTable.indexPathForSelectedRow?.row {
                destination.book = books?[index]
            }
        }
    }
}

extension BooksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        if let title = books?[indexPath.row].title {
            cell.textLabel?.text = "\(title)"
            cell.isEditing = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the book from your data source first
            books?.remove(at: indexPath.row)
            // Then delete the row from the tableView
            tableView.deleteRows(at: [indexPath], with: .fade)
            if books?.count == 0 {
                let alert = UIAlertController(title: "Books", message: "No more books to show", preferredStyle: .alert)
                self.present(alert, animated: true)
            }
        }
    }
}


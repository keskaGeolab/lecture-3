import Foundation

struct Book: Hashable {
    let title: String
    let author: String
    let emoji: String
    let about: String
}

let books: [Book] = [
    Book(title: "The Little Prince", author: "Antoine de Saint-Exupéry", emoji: "🌟", about: "A story about friendship, love and seeing what is important in life."),
    Book(title: "1984", author: "George Orwell", emoji: "👁️", about: "A novel about a society controlled by surveillance and strict rules."),
    Book(title: "Harry Potter", author: "J.K. Rowling", emoji: "🪄", about: "A young wizard discovers magic, friendship and a dangerous adventure."),
    Book(title: "The Hobbit", author: "J.R.R. Tolkien", emoji: "🧙", about: "Bilbo Baggins goes on an unexpected adventure with a group of dwarves."),
    Book(title: "Pride and Prejudice", author: "Jane Austen", emoji: "💌", about: "A classic story about relationships, family and first impressions.")
]

import SwiftUI

struct ContentView: View {
    var body: some View {
        RootView()
    }
}

struct RootView: View {
    var body: some View {
        TabView {
            BooksView()
                .tabItem {
                    Label("წიგნები", systemImage: "book")
                }

            AboutView()
                .tabItem {
                    Label("ჩემ შესახებ", systemImage: "person")
                }
        }
    }
}

struct BooksView: View {
    @State private var path: [Book] = []

    var body: some View {
        NavigationStack(path: $path) {
            List(books, id: \.self) { book in
                NavigationLink(value: book) {
                    HStack {
                        Text(book.emoji)
                            .font(.largeTitle)
                        Text(book.title)
                    }
                }
            }
            .navigationTitle("ჩემი წიგნები")
            .navigationDestination(for: Book.self) { book in
                BookDetailView(book: book)
            }
            .toolbar {
                Button("შემთხვევითი წიგნი") {
                    if let book = books.randomElement() {
                        path.append(book)
                    }
                }
            }
        }
    }
}

struct BookDetailView: View {
    let book: Book
    @State private var showAuthor = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(book.emoji)
                    .font(.system(size: 90))

                Text(book.title)
                    .font(.largeTitle)
                    .bold()

                Text(book.author)
                    .font(.title3)

                Text(book.about)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Button("ავტორის შესახებ") {
                    showAuthor = true
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showAuthor) {
            AuthorView(author: book.author)
                .presentationDetents([.medium])
        }
    }
}

struct AuthorView: View {
    let author: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("ავტორი")
                .font(.title)
                .bold()

            Text(author)
                .font(.title2)

            Button("დახურვა") {
                dismiss()
            }
        }
        .padding()
    }
}

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text("👤")
                    .font(.system(size: 70))

                Text("ჩემ შესახებ")
                    .font(.largeTitle)
                    .bold()

                Text("მე მიყვარს წიგნების კითხვა და ამ აპლიკაციაში ჩემი საყვარელი წიგნების სია მაქვს.")
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .navigationTitle("ჩემ შესახებ")
        }
    }
}

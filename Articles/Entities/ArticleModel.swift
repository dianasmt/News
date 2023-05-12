import Foundation

struct ArticleModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let author: String
    let date: String
    let imageUrl: URL?
}

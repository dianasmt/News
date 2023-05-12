import Foundation
import Combine

class ArticleViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([ArticleModel])
    }
    
    @Published private(set) var state = State.idle
    private var cancellable: AnyCancellable?
    
    func getArticles() {
        state = .loading
        cancellable = ArticlesService.shared.fetchArticles()
            .map { articles in
                articles.map { article in
                    self.articleModel(from: article)
                }
            }
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .failure(let error):
                    self.state = .failed(error)
                case .finished:
                    break
                }
            } receiveValue: { articles in
                self.state = .loaded(articles)
            }
    }
    
    private func articleModel(from article: Article) -> ArticleModel {
        let date = article.publishedAt ?? ""
        let formattedDate = formatDate(for: date)
        let urlString = article.urlToImage ?? ""
        let url = URL(string: urlString)
        return ArticleModel(
            title: article.title ?? "",
            description: article.description ?? "",
            author: article.author ?? "",
            date: formattedDate,
            imageUrl: url)
    }
    
    private func formatDate(for date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let inputDate = dateFormatter.date(from: date) else { return "" }
        
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: inputDate)
    }
}


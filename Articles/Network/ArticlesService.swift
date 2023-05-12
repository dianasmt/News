import Foundation
import Combine

class ArticlesService: ObservableObject {
    static let shared = ArticlesService()
    func fetchArticles() -> AnyPublisher<[Article], Error> {
        let request = URLRequest(url: APIConstants.articlesURL)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map{ $0.articles }
            .eraseToAnyPublisher()
    }
}

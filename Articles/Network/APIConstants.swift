import Foundation

struct APIConstants {
    static let baseURL = "https://newsapi.org"
    static let path = "/v2/everything"
    static let query = "q=tesla&from=2023-04-11&sortBy=publishedAt&apiKey=8b80892734104df791115e722a6847d8"
    static var articlesURL: URL {
        return URL(string: baseURL + path + "?" + query)!
    }
}

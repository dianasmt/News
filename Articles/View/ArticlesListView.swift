import SwiftUI

struct ArticleListView: View {
    @ObservedObject private var articleViewModel = ArticleViewModel()
    
    var body: some View {
        switch articleViewModel.state {
        case .idle:
            Color.clear.onAppear {
                articleViewModel.getArticles()
            }
        case .failed(let error):
            ErrorView(error: error, retryHandler: articleViewModel.getArticles)
        case .loading:
            ProgressView()
        case .loaded(let articles):
            NavigationView {
                List(articles, id: \.id) { article in
                    NavigationLink(destination: ArticleDetailsView(article: article)) {
                        ArticleRowView(article: article)
                    }
                }
                .navigationTitle("News")
            }
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}




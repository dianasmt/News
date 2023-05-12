import SwiftUI


struct ArticleDetailsView: View {
    let article: ArticleModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24.0) {
                AsyncImage(url: article.imageUrl,
                           content: { image in
                    image.resizable()
                        .scaledToFill()
                        .clipped()
                        .cornerRadius(12.0)
                }) {
                    ProgressView()
                }
                Text(article.title)
                    .font(.system(size: 18.0, weight: .bold))
                    .multilineTextAlignment(.center)
                Text("By: \(article.author)")
                    .font(.system(size: 14.0, weight: .semibold))
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                VStack(alignment: .trailing) {
                    Text(article.description)
                        .font(.system(size: 16.0, weight: .light))
                    Text(article.date)
                        .font(.system(size: 14.0, weight: .light))
                }
            }
            .padding(.horizontal, 16.0)
        }
    }
}

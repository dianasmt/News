import SwiftUI

struct ArticleRowView: View {
    let article: ArticleModel
    
    var body: some View {
        HStack {
            AsyncImage(url: article.imageUrl,
                       content: { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 70.0, height: 70.0)
                    .clipped()
                    .cornerRadius(12.0)
            }) {
                SkeletonRow()
                    .frame(width: 70.0, height: 70.0)
            }
            VStack(alignment: .leading, spacing: 8.0) {
                Text(article.title)
                    .font(.system(size: 16.0, weight: .medium))
                    .lineLimit(2)
                Text(article.description)
                    .font(.system(size: 12.0))
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
    }
}




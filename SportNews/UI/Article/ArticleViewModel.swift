import Foundation

final class ArticleViewModel: ObservableObject {
    @Published var title: String
    @Published var imageUrl: URL?
    @Published var textBody: String

    init(article: Article) {
        title = article.title
        imageUrl = URL(string: article.imageUrlString)
        textBody = article.body
    }

    static func sample() -> ArticleViewModel {
        ArticleViewModel(article: Article.sample())
    }
}

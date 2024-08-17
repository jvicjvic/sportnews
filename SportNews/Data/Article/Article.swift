import Foundation

struct Article: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let imageUrlString: String
    let body: String
    let createdAt: Date
    let updatedAt: Date


    let deletedAt: Date?

    static func sample() -> Article {
        Article(
            id: "1",
            title: "This is a placeholder title for article rows. This is a placeholder article title.",
            imageUrlString:
                "https://cdn.theathletic.com/app/uploads/2023/11/06102929/GettyImages-1763970470-1024x683.jpg",
            body: "This is a test",
            createdAt: Date(),
            updatedAt: Date(),
            deletedAt: nil
        )
    }
}

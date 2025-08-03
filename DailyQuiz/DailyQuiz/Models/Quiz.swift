import Foundation

struct Quiz: Identifiable {
    var id: UUID = .init()
    var title: String
    var questions: [Question]
    var score: Int
    var category: String?
    var difficulty: String?
    var completionDate: String
    var completionTime: String
    
    static let dummy: Quiz = .init(
        title: "Dummy Quiz",
        questions: [],
        score: 4,
        completionDate: "7 июля",
        completionTime: "12:03"
    )
}

extension Quiz: Equatable {
    static func == (lhs: Quiz, rhs: Quiz) -> Bool {
        lhs.id == rhs.id
    }
}

import Foundation

struct Quiz {
    static var count: Int = 0 {
        didSet {
            print("TOTAL QUIZZES: \(count)")
        }
    }
    
    var id: UUID = .init()
    var title: String
    var questions: [Question]
    var score: Int
    var category: String?
    var difficulty: String?
    var completionDate: String
    var completionTime: String
    
    init(questions: [Question], score: Int, category: String? = nil, difficulty: String? = nil, completionDate: String, completionTime: String) {
        Quiz.count += 1
        self.title = "Quiz #\(Quiz.count)"
        self.questions = questions
        self.score = score
        self.category = category
        self.difficulty = difficulty
        self.completionDate = completionDate
        self.completionTime = completionTime
    }
}

extension Quiz: Equatable {
    static func == (lhs: Quiz, rhs: Quiz) -> Bool {
        lhs.id == rhs.id
    }
}

import Foundation

class Question: Codable, Identifiable {
    let id: UUID
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    let allAnswers: [String]
    var userAnswer: String?
    
    private enum CodingKeys: String, CodingKey {
        case type, difficulty, category, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
    func isCorrect() -> Bool {
        guard let userAnswer = userAnswer else { return false }
        return userAnswer == correctAnswer
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = UUID()
        type = try container.decodeBase64(String.self, forKey: .type)
        difficulty = try container.decodeBase64(String.self, forKey: .difficulty)
        category = try container.decodeBase64(String.self, forKey: .category)
        question = try container.decodeBase64(String.self, forKey: .question)
        correctAnswer = try container.decodeBase64(String.self, forKey: .correctAnswer)
        
        let base64Answers = try container.decode([String].self, forKey: .incorrectAnswers)
        incorrectAnswers = base64Answers.map { $0.base64Decoded ?? "INVALID" }
        self.allAnswers = ([correctAnswer] + incorrectAnswers).shuffled()
        
    }
    
    init(type: String, difficulty: String, category: String, question: String, correctAnswer: String, incorrectAnswers: [String]) {
        self.id = UUID()
        self.type = type
        self.difficulty = difficulty
        self.category = category
        self.question = question
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
        self.allAnswers = ([correctAnswer] + incorrectAnswers).shuffled()
    }
    
    static let dummy: Question = .init(
        type: "multiple",
        difficulty: "medium",
        category: "Entertainment: Television",
        question: "At which university do &quot;The Big Bang Theory&quot; characters Mr. Wolowitz and Drs. Cooper, Hofstadter and Koothrappali work?",
        correctAnswer: "Caltech",
        incorrectAnswers: [
            "UCLA",
            "MIT",
            "UC Berkeley "
        ]
    )
}

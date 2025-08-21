import Foundation

class Question: Codable, Identifiable {
    var id: UUID { .init() }
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
    
    init(
        type: String,
        difficulty: String,
        category: String,
        question: String,
        correctAnswer: String,
        incorrectAnswers: [String]
    ) {
        self.type = type
        self.difficulty = difficulty
        self.category = category
        self.question = question
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
        self.allAnswers = ([correctAnswer] + incorrectAnswers).shuffled()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let base64Answers = try container.decode([String].self, forKey: .incorrectAnswers)
        
        type = try container.decodeBase64(String.self, forKey: .type)
        difficulty = try container.decodeBase64(String.self, forKey: .difficulty)
        category = try container.decodeBase64(String.self, forKey: .category)
        question = try container.decodeBase64(String.self, forKey: .question)
        correctAnswer = try container.decodeBase64(String.self, forKey: .correctAnswer)
        
        incorrectAnswers = base64Answers.map { $0.base64Decoded ?? "INVALID" }
        self.allAnswers = ([correctAnswer] + incorrectAnswers).shuffled()
    }
}

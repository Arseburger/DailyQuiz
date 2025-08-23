import Foundation

struct Question: Codable, Identifiable {
    var id: UUID = UUID() //{ .init() }
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    let allAnswers: [String]
    var userAnswer: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, type, difficulty, category, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        case userAnswer = "user_answer"
        case allAnswers = "all_answers"
    }
    
    func isCorrect() -> Bool {
        guard let userAnswer = userAnswer else { return false }
        return userAnswer == correctAnswer
    }
    
    init(
        id: UUID = UUID(),
        type: String,
        difficulty: String,
        category: String,
        question: String,
        correctAnswer: String,
        incorrectAnswers: [String],
        userAnswer: String? = nil,
        allAnswers: [String]? = nil
    ) {
        self.id = id
        self.type = type
        self.difficulty = difficulty
        self.category = category
        self.question = question
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
        self.userAnswer = userAnswer
        self.allAnswers = allAnswers ?? ([correctAnswer] + incorrectAnswers).shuffled()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let base64Answers = try container.decode([String].self, forKey: .incorrectAnswers)
        
        type = try container.decodeBase64(String.self, forKey: .type)
        difficulty = try container.decodeBase64(String.self, forKey: .difficulty)
        category = try container.decodeBase64(String.self, forKey: .category)
        question = try container.decodeBase64(String.self, forKey: .question)
        correctAnswer = try container.decodeBase64(String.self, forKey: .correctAnswer)
        incorrectAnswers = base64Answers.map { $0.base64Decoded ?? "INVALID" }

            if container.contains(.userAnswer) {
                self.userAnswer = try container.decodeBase64IfPresent(String.self, forKey: .userAnswer)
            } else {
                self.userAnswer = nil
            }
        
        self.allAnswers = ([correctAnswer] + incorrectAnswers).shuffled()
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encodeBase64(self.type, forKey: .type)
        try container.encodeBase64(self.difficulty, forKey: .difficulty)
        try container.encodeBase64(self.category, forKey: .category)
        try container.encodeBase64(self.question, forKey: .question)
        try container.encodeBase64(self.correctAnswer, forKey: .correctAnswer)
        try container.encodeBase64(self.incorrectAnswers, forKey: .incorrectAnswers)
        try container.encodeBase64IfPresent(self.userAnswer, forKey: .userAnswer)
        try container.encodeBase64(self.allAnswers, forKey: .allAnswers)
    }
}

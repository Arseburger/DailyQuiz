import Foundation

struct Question: Codable {
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
    var allAnswers: [String] {
        return [correct_answer] + incorrect_answers
    }
    
    static let dummy: Question = .init(
        type: "multiple",
        difficulty: "medium",
        category: "Entertainment: Television",
        question: "At which university do &quot;The Big Bang Theory&quot; characters Mr. Wolowitz and Drs. Cooper, Hofstadter and Koothrappali work?",
        correct_answer:"Caltech",
        incorrect_answers: [
            "UCLA",
            "MIT",
            "UC Berkeley "
        ]
    )
}

import Foundation

final class QuizViewModel: ObservableObject {
    @Published var questions: [Question]
    @Published var score: Int = 0
    @Published var index: Int = 0
    @Published var selectedAnswer: String?
    @Published var isFinished: Bool = false
    
    var currentQuestion: Question {
        return questions[index]
    }
    
    var isLastQuestion: Bool {
        index == questions.count - 1
    }
    
    func nextQuestion() {
        guard !isLastQuestion else { return }
        self.selectedAnswer = nil
        index += 1
    }
    
    func startNewQuiz() {
        isFinished = false
        selectedAnswer = nil
        index = 0
        score = 0
        questions.forEach { $0.userAnswer = nil }
    }
    
    func finishQuiz() {
        isFinished = true
        getTotalScore()
    }
    
    func saveAnswer() {
        guard let selectedAnswer else { return }
        questions[index].userAnswer = selectedAnswer
    }
    
    private func getTotalScore() {
        score = questions.map { question in
            question.correctAnswer == question.userAnswer
        }.reduce(into: 0) { score, isCorrect in
            score += isCorrect ? 1 : 0
        }
    }
    
    init() {
        if let questionsData = MockData.shared.response?.results {
            self.questions = questionsData
        } else {
            self.questions = []
        }
    }
}

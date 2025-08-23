import Foundation

@MainActor
final class QuizViewModel: ObservableObject {
    @Published var state: QuizState = .idle
    @Published var questions: [Question] = []
    @Published var index: Int = 0
    @Published var selectedAnswer: String?
    @Published var isFinished: Bool = false
    @Published var quiz: Quiz?
    var score: Int = 0
    
    private weak var service: NetworkService? = DI.shared.service
    
    var currentQuestion: Question? {
        guard index < questions.count else { return nil }
        return questions[index]
    }
    
    var isLastQuestion: Bool {
        index == questions.count - 1
    }
    
    var canKeepQuiz: Bool {
        !questions.isEmpty && !isFinished
    }
}

// MARK: Quiz Flow
extension QuizViewModel {
    func nextQuestion() {
        guard !isLastQuestion else { return }
        self.selectedAnswer = nil
        index += 1
    }
    
    func saveAnswer() {
        guard let selectedAnswer else { return }
        questions[index].userAnswer = selectedAnswer
    }
    
    func finishQuiz() {
        isFinished = true
        getTotalScore()
        let (day, time) = Date.getDateAndTime()
        quiz = Quiz(
            questions: questions,
            score: score,
            completionDate: day,
            completionTime: time
        )
    }
    
    func resetState() {
        state = .idle
        questions.removeAll()
        (score, index) = (0, 0)
        (selectedAnswer, quiz) = (nil, nil)
        isFinished = false
    }
    
    func pauseQuiz() {
        guard canKeepQuiz else { return }
        state = .suspended
    }
    
    private func getTotalScore() {
        score = questions
            .map { $0.correctAnswer == $0.userAnswer }
            .reduce(into: 0) { score, isCorrect in
                score += isCorrect ? 1 : 0
            }
    }
}

// MARK: API
extension QuizViewModel {
    func loadQuestions(category: String? = nil, difficulty: String? = nil) {
        guard state == .idle else { return }
        
        state = .loading
        Task {
            let response = await service?.loadQuestions(category: category, difficulty: difficulty)
            switch response {
            case .success(let data):
                self.questions = data.results
                self.state = .loaded
            case .failure(let error):
                self.state = .error(error.localizedDescription)
            case .none:
                self.state = .error("Не удалось загрузить вопросы")
            }
        }
    }
}

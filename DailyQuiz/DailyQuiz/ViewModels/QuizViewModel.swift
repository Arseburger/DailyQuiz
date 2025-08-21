import Foundation

@MainActor
final class QuizViewModel: ObservableObject {
    @Published var state: State = .idle
    @Published var questions: [Question] = []
    @Published var score: Int = 0
    @Published var index: Int = 0
    @Published var selectedAnswer: String?
    @Published var isFinished: Bool = false
    @Published var quiz: Quiz?
    
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
    
    // MARK: — API
    func loadQuestions(category: String? = nil, difficulty: String? = nil) {
        guard state == .idle else { return }
        
        state = .loading
        Task {
            let response = await service?.loadQuestions(category: category, difficulty: difficulty)
            switch response {
            case .success(let data):
                self.questions = data.results
                self.state = .loaded(data.results)
            case .failure(let error):
                self.state = .error(error.localizedDescription)
            case .none:
                self.state = .error("Не удалось загрузить вопросы")
            }
        }
    }
    
    // MARK: — Flow
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
        score = 0
        index = 0
        selectedAnswer = nil
        isFinished = false
        quiz = nil
    }
    
    func pauseQuiz() {
        guard canKeepQuiz else { return }
        state = .suspended
    }
    
    private func getTotalScore() {
        score = questions.map { $0.correctAnswer == $0.userAnswer }
            .reduce(into: 0) { score, isCorrect in
                score += isCorrect ? 1 : 0
            }
    }
}

extension QuizViewModel {
    enum State: Equatable {
        static func == (lhs: QuizViewModel.State, rhs: QuizViewModel.State) -> Bool {
            switch (lhs, rhs) {
            case (.idle, .idle), (.loading, .loading), (.loaded, .loaded), (.error, .error):
                return true
            default:
                return false
            }
        }
        
        case idle
        case loading
        case loaded([Question])
        case error(String)
        case suspended
    }
}

import Foundation

final class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var score: Int = 0
    @Published var index: Int = 0
    @Published var selectedAnswer: String?
    @Published var isFinished: Bool = false
    
    init() {
        startNewQuiz()
    }
    
    
    var currentQuestion: Question? {
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
        
        let (day, time) = Date.getDateAndTime()
        
        let quiz = Quiz(title: "", questions: questions, score: score, completionDate: day, completionTime: time)
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
    
    // MARK: API Calls
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    private weak var service: NetworkService? = DI.shared.service
    
    @MainActor
    func loadQuestions(category: String? = nil, difficulty: String? = nil) {
        isLoading = true
        if hasError { hasError = false }
        
        Task {
            let response = await self.service?.loadQuestions(category: category, difficulty: difficulty)
            switch response {
            case .success(let questionsData):
                self.questions = questionsData.results
                isLoading = false
            case .failure(let error):
                self.hasError = true
                isLoading = false
            default:
                break
            }
        }
    }
}

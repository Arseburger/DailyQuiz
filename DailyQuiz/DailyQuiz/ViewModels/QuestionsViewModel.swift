import Foundation

final class QuestionsViewModel: ObservableObject {
    @Published var questions: [Question]
    @Published var score: Int = 0
    @Published var index: Int = 0
    @Published var selectedAnswer: String?
    @Published var isFinished: Bool = false
    
    var isLastQuestion: Bool {
        index == questions.count - 1
    }
    
    var chosenAnswers: [String] = []
    
    var currentQuestion: Question {
        return questions[index]
    }
    
    func nextQuestion() {
        guard let selectedAnswer, !isFinished else { return }
        chosenAnswers.append(selectedAnswer)
        guard index < questions.count - 1 else { return }
        self.selectedAnswer = nil
        if !isLastQuestion { index += 1 }
    }
    
    func totalScore() -> String {
        if let answer = selectedAnswer, isLastQuestion, !isFinished {
            chosenAnswers.append(answer)
        }
        score = chosenAnswers.indices.map {
            index in chosenAnswers[index] == questions[index].correctAnswer
        }.reduce(into: 0) { res, element in
            res += element ? 1 : 0
        }
        isFinished = true
        return "Your score is \(score)"
    }
    
    init() {
        if let questionsData = MockData.shared.response?.results {
            self.questions = questionsData
        } else {
            self.questions = []
        }
    }
}

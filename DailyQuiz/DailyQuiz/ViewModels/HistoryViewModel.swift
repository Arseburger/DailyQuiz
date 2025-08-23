import SwiftUI

final class HistoryViewModel: ObservableObject {
    @Published var quizes: [Quiz] = []
    @Published var selectedQuiz: Quiz?
    
    func removeQuiz(_ quiz: Quiz) {
        guard quizes.contains(quiz) else { return }
        quizes.removeAll {
            $0.id == quiz.id
        }
    }
    
    func addQuiz(_ quiz: Quiz) {
        guard !quizes.contains(quiz) else { return }
        quizes.append(quiz)
    }
    
    func deleteQuiz(at index: Int) {
        guard index < quizes.count else { return }
        quizes.remove(at: index)
        Quiz.count -= 1
    }
    
    init() {
        self.quizes = (1...5).map { index in
            Quiz(
                questions: [],
                score: index,
                completionDate: "8 июля",
                completionTime: "14:15"
            )
        }
    }
}

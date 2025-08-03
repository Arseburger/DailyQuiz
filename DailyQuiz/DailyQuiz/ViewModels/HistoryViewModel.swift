import SwiftUI

final class HistoryViewModel: ObservableObject {
    @Published var quizes: [Quiz] = []
    @Published var selectedQuiz: Quiz?
    
    func removeQuiz(_ quiz: Quiz) {
        guard quizes.contains(quiz) else {
            return
        }
        quizes.removeAll {
            $0.id == quiz.id
        }
    }
    
    func deleteQuiz(at index: Int) {
        guard index < quizes.count else {
            return
        }
        quizes.remove(at: index)
    }
    
    init() {
        self.quizes = (1...5).map { index in
            .init(
                title: "Quiz \(index)",
                questions: [],
                score: index,
                completionDate: "8 июля",
                completionTime: "14:15"
            )
        }
    }
}

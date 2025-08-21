import SwiftUI

final class AnswerCellViewModel: ObservableObject {
    @Published var answer: String
    @Published var questionType: QuestionType
    @Published var isCorrect: (String) -> Bool
    @Published var isSelected: Bool
    
    var answerType: AnswerType {
        answerType(forQuestion: questionType)
    }
    
    private func answerType(forQuestion type: QuestionType) -> AnswerType {
        switch type {
        case .unanswered:
            return isSelected ? .selected : .empty
        case .answered:
            return isSelected ? isCorrect(answer) ? .correct : .wrong : .empty
        }
    }
    
    init(
        answer: String,
        questionType: QuestionType,
        isCorrect: @escaping (String) -> Bool,
        isSelected: Bool
    ) {
        self.answer = answer
        self.questionType = questionType
        self.isCorrect = isCorrect
        self.isSelected = isSelected
    }
}

import SwiftUI

struct AnswerCell: View {
    @EnvironmentObject var viewModel: QuizViewModel
    @State var questionType: QuestionType
    let answer: String
    var answerType: AnswerType {
        answerType(forQuestion: questionType)
    }
    
    var isCorrect: (String) -> Bool
    var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            Image(answerType(forQuestion: questionType).icon)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(16)
            
            Text(answer)
                .font(.interRegular(size: 14))
                .foregroundStyle(answerType(forQuestion: questionType).textColor)
            
            Spacer()
        }
        .frame(height: 52)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(answerType(forQuestion: questionType).backgroundColor)
                .bordered(color: answerType(forQuestion: questionType).fillColor)
            
        }
        .onTapGesture {
            withAnimation(.smooth(duration: 0.3)) {
                viewModel.selectedAnswer = isSelected ? nil : answer
            }
        }
    }
    
    func answerType(forQuestion type: QuestionType) -> AnswerType {
        switch type {
        case .unanswered:
            return isSelected ? .selected : .empty
        case .answered:
            return isSelected ? isCorrect(answer) ? .correct : .wrong : .empty
        }
    }
}

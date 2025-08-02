import SwiftUI

enum CellStyle {
    case empty
    case correct
    case selected
    case wrong
    
    var icon: ImageResource {
        switch self {
        case .correct:
            return .buttonCorrect
        case .selected:
            return .buttonSelected
        case .wrong:
            return .buttonWrong
        case .empty:
            return .buttonEmpty
        }
    }
    
    var color: Color {
        switch self {
        case .correct:
            return .dqGreen
        case .selected:
            return .dqDeepPurple
        case .wrong:
            return .dqRed
        case .empty:
            return .clear
        }
    }
}

struct AnswerCell: View {
    @EnvironmentObject var viewModel: QuestionsViewModel
    var isSelected: Bool {
        viewModel.selectedAnswer == answer
    }
    let answer: String
    
    var body: some View {
        HStack(spacing: 0) {
            Image(isSelected ? .buttonSelected : .buttonEmpty)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(16)
                
            Text(answer)
                .font(.interRegular(size: 14))
                .foregroundStyle(isSelected ? .dqDeepPurple : .black)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(isSelected ? .white : .dqWhiteGrey)
                .bordered(color: isSelected ? .dqDeepPurple : .clear)
                
        }
        .padding(.horizontal, 6)
        .onTapGesture {
            withAnimation(.smooth(duration: 0.3)) {
                if !viewModel.isFinished {
                    viewModel.selectedAnswer = isSelected ? nil : answer
                }

            }
        }
    }
}

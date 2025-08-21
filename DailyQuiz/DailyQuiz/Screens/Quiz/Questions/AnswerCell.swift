import SwiftUI

struct AnswerCell: View {
    @ObservedObject var viewModel: AnswerCellViewModel
    @Binding var selectedAnswer: String?
    var body: some View {
        HStack(spacing: 0) {
            Image(viewModel.answerType.icon)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(16)
            
            Text(viewModel.answer)
                .font(.interRegular(size: 14))
                .foregroundStyle(viewModel.answerType.textColor)
            
            Spacer()
        }
        .frame(height: 52)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(viewModel.answerType.backgroundColor)
                .bordered(color: viewModel.answerType.fillColor)
            
        }
        .onTapGesture {
            withAnimation(.smooth(duration: 0.3)) {
                selectedAnswer = viewModel.isSelected ? nil : viewModel.answer
            }
        }
    }
}

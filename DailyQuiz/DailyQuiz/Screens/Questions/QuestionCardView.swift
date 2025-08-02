import SwiftUI

struct QuestionCardView: View {
    @EnvironmentObject var viewModel: QuestionsViewModel
    var question: Question
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Вопрос \(viewModel.index + 1) из \(viewModel.questions.count)")
                .font(.interBold(size: 16))
                .foregroundStyle(.dqLightBlue)
                .padding(.top, 32)
            
            Text(question.question)
                .bold()
                .multilineTextAlignment(.center)
            
            VStack {
                ForEach(viewModel.questions[viewModel.index].allAnswers, id: \.self) { answer in
                    AnswerCell(answer: answer)
                        .environmentObject(viewModel)
                }
            }
            .padding(.bottom, 32)
            
            Button {
                action()
            } label: {
                let title = "\(viewModel.isLastQuestion ? "Завершить" : "Далее")"
                let shouldEnable = viewModel.selectedAnswer != nil && !viewModel.isFinished
                
                DQButton(
                    type: shouldEnable
                    ? .enabled(title)
                    : .disabled(title)
                )
            }
            .disabled(viewModel.selectedAnswer == nil || viewModel.isFinished)
            
        }
        .padding(.horizontal, 24)
        .background {
            RoundedRectangle(cornerRadius: 46)
                .fill(.white)
        }
        .padding(.horizontal, 26)
    }
}

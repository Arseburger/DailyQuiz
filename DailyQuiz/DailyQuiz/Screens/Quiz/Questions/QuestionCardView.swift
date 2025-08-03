import SwiftUI

struct QuestionCardView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            QuestionView(
                question: viewModel.currentQuestion,
                number: viewModel.index + 1,
                questionType: .unanswered
            )
            .padding(.bottom, 48)
            
            DQButton(
                title: {
                    "\(viewModel.isLastQuestion ? "Завершить" : "Далее")"
                },
                type: viewModel.selectedAnswer != nil ? .enabled : .disabled
            ) {
                viewModel.saveAnswer()
                if viewModel.isLastQuestion {
                    viewModel.finishQuiz()
                } else {
                    viewModel.nextQuestion()
                }
            }
            .padding(.bottom, 32)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 30)
        .background {
            RoundedRectangle(cornerRadius: 46)
                .fill(.white)
        }
    }
}

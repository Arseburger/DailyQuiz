import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewModel: QuestionsViewModel
    
    var body: some View {
        ZStack {
            Color(.dqMain)
                .ignoresSafeArea()
            
            VStack {
                DQLogoImage()
                Spacer()
                QuestionCardView(question: viewModel.currentQuestion) {
                    if viewModel.isLastQuestion && !viewModel.isFinished {
                        // MARK: TODO - Results Screen
                        print(viewModel.totalScore())
                    } else {
                        viewModel.nextQuestion()
                    }
                }
                .environmentObject(viewModel)
                
                Text("Вернуться к предыдущим вопросам нельзя")
                    .font(.interRegular(size: 10))
                    .foregroundStyle(.white)
                    .padding(.top, 12)
                Spacer()
            }
        }
    }
}

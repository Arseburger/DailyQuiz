import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewModel: QuestionsViewModel
    
    var body: some View {
        ZStack {
            
            Color(.dqMain)
                .ignoresSafeArea()
            
            VStack {
                
                DQLogoImage()
                
                QuestionCardView(question: viewModel.currentQuestion) {
                    if viewModel.isLastQuestion {
                        // MARK: TODO: Results Screen
                    } else {
                        viewModel.nextQuestion()
                    }
                }
                .environmentObject(viewModel)
                
                Text("Вернуться к предыдущим вопросам нельзя")
                    .font(.interRegular(size: 10))
                    .foregroundStyle(.white)
                    .padding(.top, 12)
                
//                Spacer()
            }
        }
    }
}

#Preview {
    QuizView()
        .environmentObject(QuestionsViewModel())
}

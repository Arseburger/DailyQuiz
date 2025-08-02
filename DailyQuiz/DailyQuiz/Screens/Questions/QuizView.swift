import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewModel: QuestionsViewModel
    
    var body: some View {
        ZStack {
            Color(.dqMain)
                .ignoresSafeArea()
            
            VStack {
                if !viewModel.isFinished {
                    DQLogoImage()
                    
                    Spacer()
                    
                    QuestionCardView(question: viewModel.currentQuestion) {
                        if viewModel.isLastQuestion && !viewModel.isFinished {
                            viewModel.totalScore()
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
                    
                } else {
                    Text("Результаты")
                        .font(.interBlack(size: 32))
                        .foregroundStyle(.white)
                        .padding(.top, 32)
                    
                    ResultsView(result: .getResult(viewModel.score)) {
                        viewModel.reset()
                    }
                    .padding(.top, 40)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 26)
        }
    }
}

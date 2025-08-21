import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: QuizViewModel
    @EnvironmentObject var historyViewModel: HistoryViewModel
    
    var body: some View {
        VStack {
            Text("Результаты")
                .font(.interBlack(size: 32))
                .foregroundStyle(.white)
                .padding(.top, 32)
            
            ScrollView(showsIndicators: false) {
                ScoreView(result: .getResult(viewModel.score))
                    .padding(.top, 40)
                
                Text("Твои ответы")
                    .font(.interBlack(size: 32))
                    .foregroundStyle(.white)
                    .padding(.vertical, 32)
                
                VStack {
                    ForEach(viewModel.questions.indices, id: \.self) { index in
                        QuestionView(question: viewModel.questions[index], number: index + 1, questionType: .answered)
                    }
                }
                
                DQButton(title: { "Начать заново" }, type: .info) {
                    historyViewModel.addQuiz(viewModel.quiz!)
                    dismiss()
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 30)
            }
        }
        .onDisappear {
            if viewModel.isFinished {
                viewModel.resetState()
            }
        }
        .navigationBarHidden(true)
    }
}

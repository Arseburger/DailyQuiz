import SwiftUI

struct QuizView: View {
    @EnvironmentObject private var viewModel: QuizViewModel
    
    var body: some View {
        ZStack {
            if !viewModel.questions.isEmpty {
                Color(.dqMain)
                    .ignoresSafeArea()
                
                Group {
                    if !viewModel.isFinished {
                        QuestionsListView()
                    } else {
                        ResultView()
                    }
                }
                .padding(.horizontal, 26)
            }
        }
    }
}

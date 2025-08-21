import SwiftUI

struct QuizView: View {
    @EnvironmentObject private var viewModel: QuizViewModel
    @EnvironmentObject private var historyViewModel: HistoryViewModel
    
    var body: some View {
        ZStack {
            Color(.dqMain)
                .ignoresSafeArea()
            
            Group {
                if !viewModel.isFinished {
                    QuestionsListView()
                } else {
                    ResultView()
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

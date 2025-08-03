import SwiftUI

struct QuizView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
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
            .padding(.horizontal, 26)
        }
    }
}

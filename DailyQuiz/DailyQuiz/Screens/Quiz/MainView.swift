import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        NavigationStack {
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
}

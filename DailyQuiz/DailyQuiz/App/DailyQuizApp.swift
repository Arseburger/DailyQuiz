import SwiftUI

@main
struct DailyQuizApp: App {
    var viewModel = QuizViewModel()
    var historyViewModel = HistoryViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
                .environmentObject(historyViewModel)
        }
    }
}

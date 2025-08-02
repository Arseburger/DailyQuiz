import SwiftUI

@main
struct DailyQuizApp: App {
    var viewModel = QuestionsViewModel()
    
    var body: some Scene {
        WindowGroup {
            QuizView()
                .environmentObject(viewModel)
        }
    }
}

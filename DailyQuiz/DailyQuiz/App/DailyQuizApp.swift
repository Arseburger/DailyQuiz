import SwiftUI

@main
struct DailyQuizApp: App {
    var viewModel = QuizViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
                
        }
    }
}

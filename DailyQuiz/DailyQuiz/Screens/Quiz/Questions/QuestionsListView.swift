import SwiftUI

struct QuestionsListView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    var body: some View {
        VStack {
            DQLogoImage()
            
            QuestionCardView()
            
            Text("Вернуться к предыдущим вопросам нельзя")
                .font(.interRegular(size: 10))
                .foregroundStyle(.white)
                .padding(.top, 20)
            
            Spacer()
        }
    }
}

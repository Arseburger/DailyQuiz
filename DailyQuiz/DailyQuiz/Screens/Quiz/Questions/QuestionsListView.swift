import SwiftUI

struct QuestionsListView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                BackButton() {
                    
                }
                
                DQLogoImage()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
            
            QuestionCardView()
            
            Text("Вернуться к предыдущим вопросам нельзя")
                .font(.interRegular(size: 10))
                .foregroundStyle(.white)
                .padding(.top, 20)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

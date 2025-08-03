import SwiftUI

struct QuestionsListView: View {
    @Environment(\.dismiss) private var back
    @EnvironmentObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                
                BackButton()
                    .onTapGesture {
                        back()
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

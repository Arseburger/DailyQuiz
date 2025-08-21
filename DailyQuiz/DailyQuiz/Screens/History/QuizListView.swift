import SwiftUI

struct QuizListView: View {
    @Binding var isShowingPopup: Bool
    @Binding var quizes: [Quiz]
    @State private var selectedQuiz: Quiz? = nil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                ForEach(quizes, id: \.id) { quiz in
                    HistoryCell(quiz: quiz, isSelected: selectedQuiz == quiz) {
                        withAnimation(.smooth(duration: 0.7)) {
                            isShowingPopup = true
                        }
                        quizes.removeAll { $0.id == quiz.id }
                    }
                    .onLongPressGesture {
                        if selectedQuiz == quiz {
                            selectedQuiz = nil
                        } else {
                            selectedQuiz = quiz
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
//        .mask {
//            if selectedQuiz == nil {
//                Color(.black).opacity(0.1).ignoresSafeArea()
//                
//            }
//        }
    }
}

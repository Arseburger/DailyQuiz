import SwiftUI

struct QuizListView: View {
    @Binding var isShowingPopup: Bool
    @Binding var quizes: [Quiz]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                ForEach(quizes, id: \.id) { quiz in
                    HistoryCell(quiz: quiz)
                        .clipped(antialiased: false)
                        .contextMenu {
                            Button {
                                withAnimation(.smooth(duration: 0.7)) {
                                    isShowingPopup = true
                                }
                                quizes.removeAll { $0.id == quiz.id }
                            } label: {
                                Label("Удалить", systemImage: "trash")
                                    .tint(.red)
                                    .foregroundStyle(.green)
                            }
                        }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
    }
}

import SwiftUI

struct HistoryCell: View {
    let quiz: Quiz
    @State var isSelected: Bool = false
    var onDelete: () -> Void
    
    @State private var shouldShowMenu = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                HStack {
                    Text(quiz.title)
                        .font(.interBold(size: 24))
                        .foregroundStyle(.dqDeepPurple)
                    Spacer()
                    RatingView(iconSize: 16, correctQuestions: quiz.score)
                }
                
                Group {
                    HStack {
                        Text(quiz.completionDate)
                        Spacer()
                        Text(quiz.completionTime)
                    }
                    
                    if
                        let category = quiz.category,
                        let difficulty = quiz.difficulty {
                        VStack(spacing: 4) {
                            Text("Категория: \(category)")
                            Text("Сложность: \(difficulty)")
                        }
                    }
                }
                .font(.interRegular(size: 12))
                .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity)
            .padding(24)
            .background {
                RoundedRectangle(cornerRadius: 40)
                    .fill(.white)
                    .shadow(radius: shouldShowMenu ? 8 : 0)
            }
        }
    }
    
    var menuView: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    onDelete()
                    withAnimation { shouldShowMenu = false }
                } label: {
                    HStack {
                        Text("Удалить")
                            .foregroundColor(.red)
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .shadow(radius: 4)
            )
            .overlay {
                if shouldShowMenu {
                    Color(.red).opacity(0.6)
                        .ignoresSafeArea()
                }
            }
        }
        .offset(y: 120)
    }
}

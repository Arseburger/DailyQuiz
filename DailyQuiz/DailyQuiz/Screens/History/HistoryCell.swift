import SwiftUI

struct HistoryCell: View {
    let quiz: Quiz
    
    var body: some View {
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
                .font(.interRegular(size: 12))
                
                
                if let category = quiz.category, let difficulty = quiz.difficulty {
                    VStack(spacing: 4) {
                        Text("Категория: \(category)")
                        Text("Сложность: \(difficulty)")
                    }
                    .font(.interRegular(size: 12))
                }
            }
            .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background {
            RoundedRectangle(cornerRadius: 40)
                .fill(.white)
                .clipped(antialiased: true)
        }
        .clipShape(.rect(cornerRadius: 40))
    }
}

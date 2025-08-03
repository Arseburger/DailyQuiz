import SwiftUI

struct ScoreView: View {
    var result: QuizResult
    
    var body: some View {
        VStack(spacing: 24) {
            RatingView(correctQuestions: result.correctAnswers)
            
            Text("\(result.correctAnswers) из 5")
                .font(.interBold(size: 16))
                .foregroundStyle(.dqYellow)
            
            Group {
                Text(result.title)
                    .font(.interBold(size: 24))
                
                Text(result.subtitle)
                    .font(.interRegular(size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.top, -12)
            }
            .foregroundStyle(.black)
        }
        // MARK: convert to modifier -
        .padding(.horizontal, 24)
        .padding(.vertical, 32)
        .background {
            RoundedRectangle(cornerRadius: 46)
                .fill(.white)
        }
    }
}

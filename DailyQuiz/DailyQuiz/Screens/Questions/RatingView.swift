import SwiftUI

struct RatingView: View {
    var correctQuestions: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<5) { index in
                Image(index < correctQuestions ? .starFill : .starEmpty)
                    .resizable()
                    .frame(width: 52, height: 52)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

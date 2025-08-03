import SwiftUI

struct RatingView: View {
    var iconSize: CGFloat = 52
    var correctQuestions: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<5) { index in
                Image(index < correctQuestions ? .starFill : .starEmpty)
                    .resizable()
                    .frame(width: iconSize, height: iconSize)
            }
        }
    }
}

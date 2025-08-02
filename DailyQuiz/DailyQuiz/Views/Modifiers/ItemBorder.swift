import SwiftUI

struct itemBorder: ViewModifier {
    var color: Color
    var radius: CGFloat
    var width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(.rect(cornerRadius: radius))
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(color, lineWidth: width)
            )
            .padding(width * 0.5)
            .background(.clear)
    }
}

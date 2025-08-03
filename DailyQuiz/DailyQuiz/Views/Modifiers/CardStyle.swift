import SwiftUI

struct cardStyle: ViewModifier {
    var horizontalPadding: CGFloat
    var verticalPadding: CGFloat
    var radius: CGFloat
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background {
                RoundedRectangle(cornerRadius: radius)
                    .fill(.white)
            }
    }
}




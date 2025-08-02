import SwiftUI

extension View {
    func bordered(color: Color = .dqDeepPurple, radius: CGFloat = 16.0, width: CGFloat = 2.0) -> some View {
        modifier(itemBorder(color: color, radius: radius, width: width))
    }
}

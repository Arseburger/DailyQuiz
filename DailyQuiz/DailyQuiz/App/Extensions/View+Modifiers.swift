import SwiftUI

extension View {
    func bordered(color: Color = .dqDeepPurple, radius: CGFloat = 16.0, width: CGFloat = 2.0) -> some View {
        modifier(itemBorder(color: color, radius: radius, width: width))
    }
    
    func cardStyled(
        horizontalPadding: CGFloat = 24,
        verticalPadding: CGFloat = 32,
        radius: CGFloat = 46
    ) -> some View {
        modifier(
            cardStyle(
                horizontalPadding: horizontalPadding,
                verticalPadding: verticalPadding,
                radius: radius
            )
        )
    }
    
    func loader(isLoading: Binding<Bool>) -> some View {
        modifier(loaderView(isLoading: isLoading))
    }
}

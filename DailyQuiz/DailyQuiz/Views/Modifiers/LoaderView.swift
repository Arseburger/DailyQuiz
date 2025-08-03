import SwiftUI

struct loaderView: ViewModifier {
    @Binding var isLoading: Bool
    func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(2.0)
                        .frame(width: 72, height: 72)
                        .tint(.white)
                }
            }
    }
}

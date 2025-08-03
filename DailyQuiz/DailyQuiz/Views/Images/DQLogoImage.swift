import SwiftUI

struct DQLogoImage: View {
    var width: CGFloat = 180
    var height: CGFloat = 40
    var body: some View {
        Image(.dqLogo)
            .resizable()
            .frame(width: width, height: height)
            .padding(.vertical, 36)
    }
}

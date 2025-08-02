import SwiftUI

struct DQLogoImage: View {
    var body: some View {
        Image(.dqLogo)
            .resizable()
            .frame(width: 180, height: 40)
            .padding(.bottom, 40)
            .padding(.top, 36)
    }
}

import SwiftUI

struct BackButton: View {
    var body: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.white)
            .frame(width: 24, height: 24)
    }
}

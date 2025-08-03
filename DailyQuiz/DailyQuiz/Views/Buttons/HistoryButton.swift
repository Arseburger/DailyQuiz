import SwiftUI

struct HistoryButton: View {
    var body: some View {
        NavigationLink {
            HistoryView()
        } label: {
            HStack(spacing: 12) {
                Text("История")
                    .font(.interSemiBold(size: 12))
                Image(systemName: "clock")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                
            }
            .foregroundStyle(.dqMain)
            .padding(12)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
            }
        }
    }
}

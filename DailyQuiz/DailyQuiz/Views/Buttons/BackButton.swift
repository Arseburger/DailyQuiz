import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    @State var completion: (() -> Void)? = nil
    
    var body: some View {
        Button {
            dismiss()
            completion?()
        } label: {
            Image(systemName: "chevron.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.white)
                .frame(width: 24, height: 24)
        }
    }
}

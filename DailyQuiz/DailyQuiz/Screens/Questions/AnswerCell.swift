import SwiftUI

struct AnswerCell: View {
    @State var isSelected: Bool = false
    let answer: String
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(16)
                
            Text(answer)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.dqWhiteGrey)
        }
        .padding(.horizontal, 6)
    }
}

#Preview {
    AnswerCell(isSelected: false, answer: "Яблоко")
}

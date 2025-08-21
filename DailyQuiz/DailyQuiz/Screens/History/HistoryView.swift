import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var viewModel: HistoryViewModel
    @State private var isShowingPopup: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            ZStack(alignment: .leading) {
                BackButton()
                
                Text("История")
                    .font(.interBlack(size: 32))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 24)
            
            if viewModel.quizes.isEmpty {
                emptyHistoryView
            } else {
                QuizListView(isShowingPopup: $isShowingPopup, quizes: $viewModel.quizes)
            }
        }
        .navigationBarHidden(true)
        .padding(.top, 32)
        .background {
            Color(.dqMain)
                .ignoresSafeArea()
        }
        
        .overlay {
            if isShowingPopup {
                ZStack {
                    Color(.black)
                        .opacity(0.3)
                        .ignoresSafeArea()
                    
                    statusView(
                        title: "Попытка удалена",
                        message: "Вы можете пройти викторину снова, когда будете готовы.",
                        buttonTitle: "Хорошо"
                    ) {
                        isShowingPopup = false
                    }
                }
            }
        }
    }
    
    private var emptyHistoryView: some View {
        return Group {
            statusView(message: "Вы еще не проходили ни одной викторины", buttonTitle: "Начать викторину") { }
            Spacer()
            DQLogoImage()
                .padding(.bottom, 72)
        }
    }
    
    @ViewBuilder
    private func statusView(title: String? = nil, message: String, buttonTitle: String, action: @escaping () -> Void) -> some View {
        VStack {
            if let title {
                Text(title)
                    .font(.interBold(size: 24))
                    .foregroundStyle(.black)
                    .padding(.bottom, 12)
            }
            
            Text(message)
                .font(.interRegular(size: 20))
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
                .padding(.bottom, 40)
            
            DQButton(title: { buttonTitle }, type: .enabled, action: action)
        }
        .cardStyled()
        .padding(.horizontal)
    }
}

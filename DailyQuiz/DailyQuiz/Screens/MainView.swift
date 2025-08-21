import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel: QuizViewModel
    @EnvironmentObject private var historyViewModel: HistoryViewModel
    @State private var path: [Bool] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color(.dqMain)
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    HistoryButton()
                        .padding(.top, 48)
                        .opacity(viewModel.state == .loading ? 0 : 1)
                    
                    Spacer()
                    
                    DQLogoImage(width: 300, height: 68)
                    
                    VStack(spacing: 40) {
                        Text("Добро пожаловать в DailyQuiz!")
                            .font(.interBold(size: 28))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                        
                        if case .suspended = viewModel.state {
                            NavigationLink(
                                destination: { QuizView() },
                                label: {
                                    DQButtonLabel(
                                        title: { "Продолжить викторину" },
                                        type: .enabled
                                    )
                                }
                            )
                            .padding(.horizontal)
                        } else {
                            DQButton(
                                title: { "Начать викторину" },
                                type: .enabled,
                                action: {
                                    if !viewModel.canKeepQuiz {
                                        viewModel.loadQuestions()
                                    }
                                }
                            )
                        }
                    }
                    .cardStyled()
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                    .opacity(viewModel.state == .loading ? 0 : 1)
                    
                    if case .error(let message) = viewModel.state {
                        Text(message)
                            .font(.interBold(size: 20))
                            .foregroundStyle(.white)
                            .frame(height: 20)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    Spacer()
                }
                .loader(isLoading: Binding(
                    get: { viewModel.state == .loading },
                    set: { _ in }
                ))
            }
            .navigationDestination(
                isPresented: Binding(
                    get: {
                        if case .loaded = viewModel.state { return true }
                        return false
                    },
                    set: { value in
                        if !value {
                            path.removeAll()
                            viewModel.pauseQuiz()
                        }
                    }
                ),
                destination: { QuizView() }
            )
        }
    }
}

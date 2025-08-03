import SwiftUI

struct MainView: View {
    @EnvironmentObject private var viewModel: QuizViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.dqMain)
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    HistoryButton()
                        .padding(.top, 46)
                        .opacity(viewModel.isLoading ? 0 : 1)
                    
                    Spacer()
                    
                    DQLogoImage(width: 300, height: 68)
                    
                    VStack(spacing: 40) {
                        Text("Добро пожаловать в DailyQuiz!")
                            .font(.interBold(size: 28))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                        
                        NavigationLink {
                            QuizView()
                        } label: {
                            DQButtonLabel(
                                title: { "Начать викторину" },
                                type: .enabled
                            )
                        }
                        .task {
                            viewModel.loadQuestions()
                        }
                        .padding(.horizontal)
                        
                    }
                    .cardStyled()
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                    .opacity(viewModel.isLoading ? 0 : 1)
                    .loader(isLoading: $viewModel.isLoading)
                    
                    Text(viewModel.hasError ? "Ошибка! Попробуйте ещё раз" : "")
                        .font(.interBold(size: 20))
                        .foregroundStyle(.white)
                        .frame(height: 20)
                        .padding(.horizontal)
                        .opacity(viewModel.hasError || !viewModel.isLoading ? 1 : 0)
                    
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}


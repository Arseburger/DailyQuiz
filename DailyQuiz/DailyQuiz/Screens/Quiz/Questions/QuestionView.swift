import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    var question: Question?
    let number: Int
    let questionType: QuestionType
    
    var body: some View {
        
        if let question {
            VStack(spacing: 24) {
                HStack {
                    Text("Вопрос \(number) из \(viewModel.questions.count)")
                        .font(.interBold(size: 16))
                        .minimumScaleFactor(0.7)
                        .foregroundStyle(questionType == .unanswered ? .dqLightBlue : .dqLightGrey)
                    
                    if questionType == .answered {
                        Spacer()
                        
                        Image(question.isCorrect() ? .buttonCorrect : .buttonWrong)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.top, questionType == .unanswered ? 32 : -2)
                
                Text(question.question)
                    .font(.interSemiBold(size: 18))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                
                VStack {
                    ForEach(question.allAnswers, id: \.self) { answer in
                        
                        let vm = AnswerCellViewModel(
                            answer: answer,
                            questionType: questionType,
                            isCorrect: { answer in
                                answer == question.correctAnswer
                            },
                            isSelected: questionType == .unanswered
                            ? viewModel.selectedAnswer == answer
                            : question.userAnswer == answer
                        )
                        
                        AnswerCell(viewModel: vm, selectedAnswer: $viewModel.selectedAnswer)
                    }
                }
            }
            .padding(questionType == .answered ? 30 : 0)
            .background {
                RoundedRectangle(cornerRadius: 46)
                    .fill(.white)
            }
        }
    }
}

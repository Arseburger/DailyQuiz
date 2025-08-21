import Foundation

struct QuizResult {
    let correctAnswers: Int
    let totalQuestions: Int = 5
    let title: String
    let subtitle: String
    
    static func getResult(_ correctAnswers: Int) -> QuizResult {
        switch correctAnswers {
        case 0: return .zero
        case 1: return .one
        case 2: return .two
        case 3: return .three
        case 4: return .four
        case 5: return .five
        default: return .five
        }
    }
}

extension QuizResult {
    static let zero = QuizResult(
        correctAnswers: 0,
        title: "Бывает и так!",
        subtitle: "0/5 — не отчаивайтесь. Начните заново и удивите себя!"
    )
    static let one = QuizResult(
        correctAnswers: 1,
        title: "Сложный вопрос?",
        subtitle: "1/5 — иногда просто не ваш день. Следующая попытка будет лучше!"
    )
    static let two = QuizResult(
        correctAnswers: 2,
        title: "Есть над чем поработать!",
        subtitle: "2/5 — не расстраивайтесь, попробуйте ещё раз!"
    )
    static let three = QuizResult(
        correctAnswers: 3,
        title: "Хороший результат!",
        subtitle: "3/5 — вы на верном пути. Продолжайте тренироваться!"
    )
    static let four = QuizResult(
        correctAnswers: 4,
        title: "Почти идеально!",
        subtitle: "4/5 — очень близко к совершенству. Ещё один шаг!"
    )
    static let five = QuizResult(
        correctAnswers: 5,
        title: "Идеально!",
        subtitle: "5/5 — вы ответили на всё правильно. Это блестящий результат!"
    )
}

import SwiftUI

enum AnswerType {
    case empty
    case correct
    case selected
    case wrong
    
    var icon: ImageResource {
        switch self {
        case .correct:
            return .buttonCorrect
        case .selected:
            return .buttonSelected
        case .wrong:
            return .buttonWrong
        case .empty:
            return .buttonEmpty
        }
    }
    var fillColor: Color {
        switch self {
        case .correct:
            return .dqGreen
        case .selected:
            return .dqDeepPurple
        case .wrong:
            return .dqRed
        case .empty:
            return .clear
        }
    }
    var textColor: Color {
        switch self {
        case .empty:
            return .black
        default:
            return fillColor
        }
    }
    var backgroundColor: Color {
        switch self {
        case .empty:
            return .dqWhiteGrey
        default:
            return .white
        }
    }
}

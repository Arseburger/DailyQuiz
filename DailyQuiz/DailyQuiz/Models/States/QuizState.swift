import Foundation

enum QuizState: Equatable {
    case idle
    case loading
    case loaded
    case error(String)
    case suspended
}

extension QuizState {
    static func == (lhs: QuizState, rhs: QuizState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.loaded, .loaded), (.error, .error):
            return true
        default:
            return false
        }
    }
}

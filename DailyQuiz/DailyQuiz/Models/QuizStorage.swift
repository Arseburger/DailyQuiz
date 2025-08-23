import Foundation
import SwiftData

final class QuizStorage {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func saveQuiz(_ quiz: Quiz) {
        context.insert(quiz)
        do {
            try context.save()
        } catch {
            print("❌ Failed to save quiz: \(error)")
        }
    }
    
    func deleteQuiz(_ quiz: Quiz) {
        context.delete(quiz)
        do {
            try context.save()
        } catch {
            print("❌ Failed to delete quiz: \(error)")
        }
    }
    
    func fetchAll() -> [Quiz] {
        let descriptor = FetchDescriptor<Quiz>(
            sortBy: [SortDescriptor(\.title, order: .reverse)]
        )
        do {
            return try context.fetch(descriptor)
        } catch {
            print("❌ Failed to fetch quizzes: \(error)")
            return []
        }
    }
    
    func clear() {
        do {
            let quizzes = try context.fetch(FetchDescriptor<Quiz>())
            for quiz in quizzes {
                context.delete(quiz)
            }
            try context.save()
        } catch {
            print("❌ Failed to clear quizzes: \(error.localizedDescription)")
        }
    }
}

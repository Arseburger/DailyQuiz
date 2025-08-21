import Foundation

struct QuizResponse: Codable {
    let responseCode: Int
    let results: [Question]
    
    private enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
    
    static var dummy: QuizResponse {
        MockData.shared.response!
    }
}

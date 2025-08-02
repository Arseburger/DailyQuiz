import Foundation

struct QuestionsResponse: Decodable {
    let responseCode: Int
    let results: [Question]
    
    private enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
    
    static var dummy: QuestionsResponse {
        MockData.shared.response!
    }
    
}

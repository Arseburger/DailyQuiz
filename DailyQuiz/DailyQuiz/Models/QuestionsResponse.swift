import Foundation

struct QuestionsResponse: Codable {
    let responseCode: Int
    let results: [Question]
    
    static var dummy: QuestionsResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            try decoder.decode(QuestionsResponse.self, from: <#T##Data#>)
        }
    }
}

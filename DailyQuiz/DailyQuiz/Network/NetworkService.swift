import Foundation

enum NetworkError: Error {
    case invalidUrl
    case decodingFailed
    case invalidResponse
    case unknownError
}

final class NetworkService {
    private let baseUrl: String = "https://opentdb.com/api.php?amount=5&encode=base64"
    var category: String? = nil
    var difficulty: String? = nil
    var isLoading: Bool = false
    
    private lazy var session: URLSession = {
        URLSession(configuration: .default)
    }()
    
    private func request<T: Codable>(params: String? = nil) async throws -> Result<T, Error> {
        
        let stringUrl = baseUrl + (params ?? "")
        guard let url = URL(string: stringUrl) else {
            return .failure(NetworkError.invalidUrl)
        }
        
        let request = URLRequest(url: url)
        if let response = try? await session.data(for: request) {
            let data = response.0
            let decoder = JSONDecoder()
            decoder.dataDecodingStrategy = .base64
            
            if let decodedData = try? decoder.decode(T.self, from: data) {
                return .success(decodedData)
            } else {
                return .failure(NetworkError.decodingFailed)
            }
        } else {
            return .failure(NetworkError.invalidResponse)
        }
    }
    
    func getParameters() -> String {
        var params: String = ""
        if let category {
            params += "&category=\(category)"
        }
        
        if let difficulty {
            params += "&difficulty=\(difficulty)"
        }
        
        return params
    }
    
    func loadQuestions(category: String? = nil, difficulty: String? = nil) async -> Result<QuizResponse, Error> {
        isLoading = true
        self.category = category
        self.difficulty = difficulty
        
        do {
            return try await self.request(params: getParameters())
        } catch {
            return .failure(NetworkError.unknownError)
        }
    }
}

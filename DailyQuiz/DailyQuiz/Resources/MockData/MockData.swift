import Foundation

struct MockData {
    static let shared = MockData()
    let response: QuizResponse?
    
    init() {
        self.response = try? getFromJsonFile(fileName: "MockJson")
    }
}

fileprivate func getFromJsonFile<T: Decodable>(fileName: String) throws -> T? {
    let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json")!
    guard let data = try? Data(contentsOf: fileURL) else {
        return nil
    }
    let decoder = JSONDecoder()
    decoder.dataDecodingStrategy = .base64
    return try decoder.decode(T.self, from: data)
}

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

extension KeyedDecodingContainer {
    func decodeBase64(_ type: String.Type, forKey key: K) throws -> String {
        let base64Encoded = try self.decode(String.self, forKey: key)
        guard let decoded = base64Encoded.base64Decoded else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Invalid Base64 string.")
        }
        return decoded
    }
}

extension String {
    var base64Decoded: String? {
        guard let data = Data(base64Encoded: self),
              let decoded = String(data: data, encoding: .utf8) else {
            return nil
        }
        return decoded
    }
}

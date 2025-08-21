import Foundation

extension KeyedDecodingContainer {
    func decodeBase64(_ type: String.Type, forKey key: K) throws -> String {
        let base64Encoded = try self.decode(String.self, forKey: key)
        guard let decoded = base64Encoded.base64Decoded else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Invalid Base64 string.")
        }
        return decoded
    }
}

import Foundation

extension KeyedDecodingContainer {
    func decodeBase64(_ type: String.Type, forKey key: K) throws -> String {
        let base64Encoded = try self.decode(String.self, forKey: key)
        guard let decoded = base64Encoded.base64Decoded else {
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Invalid Base64 string.")
        }
        return decoded
    }
    
    func decodeBase64IfPresent(_ type: String.Type, forKey key: K) throws -> String? {
            guard let base64Encoded = try self.decodeIfPresent(String.self, forKey: key) else { return nil }
            guard let decoded = base64Encoded.base64Decoded else {
                throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "Invalid Base64 string.")
            }
            return decoded
        }
}

extension KeyedEncodingContainer {
    mutating func encodeBase64(_ value: String, forKey key: K) throws {
        try self.encode(value.base64Encoded, forKey: key)
    }

    mutating func encodeBase64IfPresent(_ value: String?, forKey key: K) throws {
        if let value {
            try self.encode(value.base64Encoded, forKey: key)
        }
    }

    mutating func encodeBase64(_ values: [String], forKey key: K) throws {
        let encoded = values.map { $0.base64Encoded }
        try self.encode(encoded, forKey: key)
    }
}

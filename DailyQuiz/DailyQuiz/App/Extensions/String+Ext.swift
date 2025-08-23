import Foundation

extension String {
    var base64Decoded: String? {
        guard let data = Data(base64Encoded: self),
              let decoded = String(data: data, encoding: .utf8) else {
            return nil
        }
        return decoded
    }
    
    var base64Encoded: String {
        Data(self.utf8).base64EncodedString()
    }
}

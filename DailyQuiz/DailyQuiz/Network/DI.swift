import Foundation

final class DI {
    static let shared = DI()
    
    lazy var service: NetworkService = {
        NetworkService()
    }()
}

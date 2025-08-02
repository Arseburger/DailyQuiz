import SwiftUI

enum DQButtonType {
    case enabled(String)
    case disabled(String)
    case info(String)
    
    var title: String {
        switch self {
        case .enabled(let title), .disabled(let title), .info(let title):
            return title
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .enabled:
            return .dqMain
        case .disabled:
            return .dqLightGrey
        case .info:
            return .white
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .enabled(_), .disabled(_):
            return .white
        case .info(_):
            return .black
        }
    }
    
    var disabled: Bool {
        switch self {
        case .enabled(_), .info(_):
            return false
        case .disabled(_):
            return true
        }
    }
}

struct DQButton: View {
    var type: DQButtonType
    
    var body: some View {
        Text(type.title.uppercased())
            .font(.interBlack())
            .foregroundStyle(type.foregroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(type.backgroundColor)
            }
            .padding(.bottom, 32)
    }
}

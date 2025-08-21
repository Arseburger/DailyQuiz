import SwiftUI

enum DQButtonType {
    case enabled
    case disabled
    case info
    
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
        self == .info ? .black : .white
    }
    
    var disabled: Bool {
        self == .disabled ? true : false
    }
}

struct DQButton: View {
    var title: () -> String
    var type: DQButtonType
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            DQButtonLabel(title: title, type: type)
        }
        .disabled(type.disabled)
    }
}

struct DQButtonLabel: View {
    var title: () -> String
    var type: DQButtonType
    
    var body: some View {
        Text(title().uppercased())
            .font(.interBlack())
            .foregroundStyle(type.foregroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(type.backgroundColor)
            }
    }
}

import SwiftUICore

extension Font {
    static func interRegular(size: CGFloat = 16) -> Font {
        return .custom("Inter-Regular", size: size)
    }
    static func interBold(size: CGFloat = 16) -> Font {
        return .custom("Inter-Bold", size: size)
    }
    static func interBlack(size: CGFloat = 16) -> Font {
        return .custom("Inter-Black", size: size)
    }
    static func interSemiBold(size: CGFloat = 16) -> Font {
        return .custom("Inter-SemiBold", size: size)
    }
}

import SwiftUI

struct ReturnToTopButton: View {
    private let action: () -> Void

    init(_ action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Circle()
                .fill(.white)
                .frame(width: 44, height: 44)
                .overlay(
                    Image(systemName: "chevron.up")
                        .foregroundColor(.black)
                )
        }
    }
}

#Preview {
    ReturnToTopButton { }
        .previewLayout(.sizeThatFits)
}

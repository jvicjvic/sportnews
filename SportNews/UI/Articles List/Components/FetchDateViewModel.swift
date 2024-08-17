import Combine
import SwiftUI

final class FetchDateViewModel: ObservableObject {
    @Published var text: String?

    private var fetchDate: Date?
    private var timer: AnyCancellable?

    init(referenceDate: Date? = nil) {
        fetchDate = referenceDate
        updateText()

        timer = Timer.publish(
            every: 1,
            on: .main,
            in: .default
        )
        .autoconnect()
        .sink { [weak self] date in
            self?.updateText()
        }
    }

    deinit {
        timer?.cancel()
    }

    @MainActor func didFetch() {
        fetchDate = Date()
        updateText()
    }

    private func updateText() {
        if let fetchDate {
            let secondsAgo = Int(abs(fetchDate.timeIntervalSinceNow))
            text = "Last fetched \(secondsAgo) seconds ago"
        }
    }
}

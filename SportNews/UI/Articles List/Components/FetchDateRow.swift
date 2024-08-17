import SwiftUI

struct FetchDateRow: View {

    @StateObject var viewModel: FetchDateViewModel

    var body: some View {
        if let text = viewModel.text {
            Text(text)
        }
    }
}

import SwiftUI
internal import Combine

struct ContentView: View {
    // SwiftUI injects the document
    @ObservedObject var document: ParquetDocumentWrapper

    var body: some View {
        NativeTableView(rows: document.rows)
            .frame(minWidth: 600, minHeight: 400)
    }
}

// Wrap ParquetDocument in ObservableObject for SwiftUI
class ParquetDocumentWrapper: ObservableObject {
    @Published var rows: [FakeRow]

    init(document: ParquetDocument) {
        self.rows = document.rows
    }
}

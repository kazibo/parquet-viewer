import SwiftUI

@main
struct ParquetViewerApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ParquetDocument()) { file in
            ContentView(document: ParquetDocumentWrapper(document: file.document))
        }
    }
}

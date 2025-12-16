import SwiftUI
import UniformTypeIdentifiers

// Define your custom file type
extension UTType {
    static let parquet = UTType(exportedAs: "com.example.parquet")
}

struct ParquetDocument: FileDocument {
    // Required: declare supported file types
    static var readableContentTypes: [UTType] { [.parquet] }

    // The data the document holds
    var rows: [FakeRow] = []
    
    init() {
        self.rows = (0..<100_000).map {
            FakeRow(id: $0, name: "row_\($0)", value: Double.random(in: 0...1000))
        }
    }

    // Required initializer to read a file
    init(configuration: ReadConfiguration) throws {
        // In real app: parse Parquet here
        // For now: generate fake data
        self.rows = (0..<100_000).map {
            FakeRow(id: $0, name: "row_\($0)", value: Double.random(in: 0...1000))
        }
    }

    // Required method to write a file
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        // Document is read-only for now
        return FileWrapper(regularFileWithContents: Data())
    }
}

// FakeRow model
struct FakeRow: Identifiable {
    let id: Int
    let name: String
    let value: Double
}

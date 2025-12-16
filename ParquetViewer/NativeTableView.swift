import SwiftUI
import AppKit

class TableDataSource: NSObject, NSTableViewDataSource, NSTableViewDelegate {
    let rows: [FakeRow]

    init(rows: [FakeRow]) {
        self.rows = rows
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        rows.count
    }

    func tableView(_ tableView: NSTableView,
                   viewFor tableColumn: NSTableColumn?,
                   row: Int) -> NSView? {

        let item = rows[row]
        let identifier = tableColumn!.identifier

        let text: String
        switch identifier.rawValue {
        case "id":
            text = "\(item.id)"
        case "name":
            text = item.name
        case "value":
            text = String(format: "%.3f", item.value)
        default:
            text = ""
        }

        let cell = NSTextField(labelWithString: text)
        cell.lineBreakMode = .byTruncatingTail
        return cell
    }
}

struct NativeTableView: NSViewRepresentable {

    let rows: [FakeRow]

    func makeNSView(context: Context) -> NSScrollView {
        let tableView = NSTableView()
        tableView.usesAlternatingRowBackgroundColors = true
        tableView.headerView = NSTableHeaderView()

        let dataSource = TableDataSource(rows: rows)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource

        let idColumn = NSTableColumn(identifier: .init("id"))
        idColumn.title = "ID"
        idColumn.width = 80

        let nameColumn = NSTableColumn(identifier: .init("name"))
        nameColumn.title = "Name"
        nameColumn.width = 200

        let valueColumn = NSTableColumn(identifier: .init("value"))
        valueColumn.title = "Value"
        valueColumn.width = 120

        tableView.addTableColumn(idColumn)
        tableView.addTableColumn(nameColumn)
        tableView.addTableColumn(valueColumn)

        let scrollView = NSScrollView()
        scrollView.documentView = tableView
        scrollView.hasVerticalScroller = true

        context.coordinator.dataSource = dataSource

        return scrollView
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator() }

    class Coordinator { var dataSource: TableDataSource? }
}

//
//  parquet_viewerApp.swift
//  parquet-viewer
//
//  Created by Igor Atsberger on 16.12.2025.
//

import SwiftUI

@main
struct parquet_viewerApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: parquet_viewerDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}

//
//  ContentView.swift
//  parquet-viewer
//
//  Created by Igor Atsberger on 16.12.2025.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: parquet_viewerDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(parquet_viewerDocument()))
}

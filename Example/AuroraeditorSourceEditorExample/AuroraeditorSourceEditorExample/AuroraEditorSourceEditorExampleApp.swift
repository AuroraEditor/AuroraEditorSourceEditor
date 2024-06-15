//
//  AuroraEditorSourceEditorExampleApp.swift
//  AuroraEditorSourceEditorExample
//
//  Created by Khan Winter on 2/24/24.
//

import SwiftUI

@main
struct AuroraEditorSourceEditorExampleApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: AuroraEditorSourceEditorExampleDocument()) { file in
            ContentView(document: file.$document, fileURL: file.fileURL)
        }
    }
}

//
//  AuroraEditorSourceEditorExampleDocument.swift
//  AuroraEditorSourceEditorExample
//
//  Created by Khan Winter on 2/24/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct AuroraEditorSourceEditorExampleDocument: FileDocument {
    var text: String

    init(text: String = "") {
        self.text = text
    }

    static var readableContentTypes: [UTType] {
        [.item]
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}

//
//  ContentView.swift
//  AuroraEditorSourceEditorExample
//
//  Created by Khan Winter on 2/24/24.
//

import SwiftUI
import AuroraEditorSourceEditor
import AuroraEditorLanguage
import AuroraEditorTextView

struct ContentView: View {
    @Binding var document: AuroraEditorSourceEditorExampleDocument

    let fileURL: URL?
    
    @State private var language: CodeLanguage = CodeLanguage.allLanguages[0]
    @State private var languageStr: String = CodeLanguage.allLanguages[0].id.rawValue
    @State private var theme: EditorTheme = .standard
    @State private var font: NSFont = NSFont.monospacedSystemFont(ofSize: 12, weight: .regular)
    @AppStorage("wrapLines") private var wrapLines: Bool = true
    @State private var cursorPositions: [CursorPosition] = []

    init(document: Binding<AuroraEditorSourceEditorExampleDocument>, fileURL: URL?) {
        self._document = document
        self.fileURL = fileURL
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Language")
                LanguagePicker(languageStr: $languageStr)
                    .frame(maxWidth: 100)
                Toggle("Wrap Lines", isOn: $wrapLines)
                Spacer()
                Text(getLabel(cursorPositions))
            }
            .padding(4)
            .zIndex(2)
            .background(Color(NSColor.windowBackgroundColor))
            Divider()
            AuroraEditorSourceEditor(
                $document.text,
                language: language,
                theme: theme,
                font: font,
                tabWidth: 4,
                lineHeight: 1.2,
                wrapLines: wrapLines,
                cursorPositions: $cursorPositions
            )
        }
        .onChange(of: languageStr, perform: { newValue in
           for l in CodeLanguage.allLanguages {
               if l.id.rawValue == newValue {
                   language = l
               }
           }
        })
        .onAppear {
            let dl = detectLanguage(fileURL: fileURL) ?? CodeLanguage.allLanguages[0]
            self.languageStr = dl.id.rawValue
        }
    }

    private func detectLanguage(fileURL: URL?) -> CodeLanguage? {
        guard let fileURL else { return nil  }
        return CodeLanguage.detectLanguageFrom(
            url: fileURL,
            prefixBuffer: document.text.getFirstLines(5),
            suffixBuffer: document.text.getLastLines(5)
        )
    }

    /// Create a label string for cursor positions.
    /// - Parameter cursorPositions: The cursor positions to create the label for.
    /// - Returns: A string describing the user's location in a document.
    func getLabel(_ cursorPositions: [CursorPosition]) -> String {
        if cursorPositions.isEmpty {
            return ""
        }

        // More than one selection, display the number of selections.
        if cursorPositions.count > 1 {
            return "\(cursorPositions.count) selected ranges"
        }

        // When there's a single cursor, display the line and column.
        return "Line: \(cursorPositions[0].line)  Col: \(cursorPositions[0].column)"
    }
}

#Preview {
    ContentView(document: .constant(AuroraEditorSourceEditorExampleDocument()), fileURL: nil)
}

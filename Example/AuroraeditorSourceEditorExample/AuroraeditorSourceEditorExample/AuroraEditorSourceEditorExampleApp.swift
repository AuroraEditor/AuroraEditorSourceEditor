//
//  AuroraEditorSourceEditorExampleApp.swift
//  AuroraEditorSourceEditorExample
//
//  Created by Khan Winter on 2/24/24.
//

import SwiftUI
import AuroraEditorLanguage

@main
struct AuroraEditorSourceEditorExampleApp: App {
    var body: some Scene {
        handleLanguageRegisteredNotification()
        return DocumentGroup(newDocument: AuroraEditorSourceEditorExampleDocument()) { file in
            ContentView(document: file.$document, fileURL: file.fileURL)
        }
    }
    
    private func handleLanguageRegisteredNotification() {
        BashLanguageHandler().registerLanguage()
        CLanguageHandler().registerLanguage()
        CPPLanguageHandler().registerLanguage()
        CSharpLanguageHandler().registerLanguage()
        CSSLanguageHandler().registerLanguage()
        GoLanguageHandler().registerLanguage()
        JavaLanguageHandler().registerLanguage()
        JavascriptLanguageHandler().registerLanguage()
        OcamlLanguageHandler().registerLanguage()
        PhpLanguageHandler().registerLanguage()
        RubyLanguageHandler().registerLanguage()
        PlainTextLanguageHandler().registerLanguage()
    }
}

//
//  LanguagePicker.swift
//  AuroraEditorSourceEditorExample
//
//  Created by Khan Winter on 2/24/24.
//

import SwiftUI
import AuroraEditorLanguage

struct LanguagePicker: View {
    @Binding var languageStr: String

    var body: some View {
        Picker(
            "Language",
            selection: $languageStr
        ) {
            ForEach(CodeLanguage.allLanguages, id: \.id) { language in
                Text(language.id.rawValue).tag(language.id.rawValue)
            }
        }
        .labelsHidden()
    }
}

#Preview {
    LanguagePicker(
        languageStr: .constant(PlainTextLanguageHandler().getLanguage().id.rawValue)
    )
}

//
//  LanguagePicker.swift
//  AuroraEditorSourceEditorExample
//
//  Created by Khan Winter on 2/24/24.
//

import SwiftUI
import AuroraEditorLanguage

struct LanguagePicker: View {
    @Binding var language: CodeLanguage

    var body: some View {
        Picker(
            "Language",
            selection: $language
        ) {
            ForEach([.default] + CodeLanguage.allLanguages, id: \.id) { language in
                Text(language.id.rawValue)
                    .tag(language)
            }
        }
        .labelsHidden()
    }
}

#Preview {
    LanguagePicker(language: .constant(.swift))
}

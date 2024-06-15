//
//  HighlighterTextView.swift
//  AuroraEditorSourceEditor
//
//  Created by Khan Winter on 1/26/23.
//

import Foundation
import AppKit
import AuroraEditorTextView

extension TextView {
    public func stringForRange(_ nsRange: NSRange) -> String? {
        textStorage.substring(from: nsRange)
    }
}

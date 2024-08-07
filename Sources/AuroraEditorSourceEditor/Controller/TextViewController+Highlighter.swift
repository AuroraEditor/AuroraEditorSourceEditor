//
//  TextViewController+Highlighter.swift
//  AuroraEditorSourceEditor
//
//  Created by Khan Winter on 10/14/23.
//

import Foundation
import SwiftTreeSitter

extension TextViewController {
    internal func setUpHighlighter() {
        if let highlighter {
            textView.removeStorageDelegate(highlighter)
            self.highlighter = nil
        }

        self.highlighter = Highlighter(
            textView: textView,
            highlightProvider: highlightProvider,
            theme: theme,
            attributeProvider: self,
            language: language,
            isSyntaxHighlightingDisabled: isSyntaxHighlightingDisabled ?? false
        )
        textView.addStorageDelegate(highlighter!)
        setHighlightProvider(self.highlightProvider)
    }

    internal func setHighlightProvider(_ highlightProvider: HighlightProviding? = nil) {
        if isSyntaxHighlightingDisabled == true {
            return
        }

        var provider: HighlightProviding?

        if let highlightProvider = highlightProvider {
            provider = highlightProvider
        } else {
            self.treeSitterClient = TreeSitterClient()
            provider = self.treeSitterClient!
        }

        if isSyntaxHighlightingDisabled == true {
            return
        }

        if let provider = provider {
            self.highlightProvider = provider
            highlighter?.setHighlightProvider(provider)
        }
    }
}

extension TextViewController: ThemeAttributesProviding {
    public func attributesFor(_ capture: CaptureName?) -> [NSAttributedString.Key: Any] {
        [
            .font: font,
            .foregroundColor: theme.colorFor(capture),
            .kern: textView.kern
        ]
    }
}

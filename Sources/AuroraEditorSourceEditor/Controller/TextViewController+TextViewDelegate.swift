//
//  TextViewController+TextViewDelegate.swift
//  AuroraEditorSourceEditor
//
//  Created by Khan Winter on 10/14/23.
//

import Foundation
import AuroraEditorTextView
import TextStory

extension TextViewController: TextViewDelegate {
    public func textView(
        _ textView: TextView,
        willReplaceContentsIn range: NSRange,
        with string: String
    ) { }

    public func textView(
        _ textView: TextView,
        didReplaceContentsIn range: NSRange,
        with string: String
    ) {
        gutterView.needsDisplay = true
        onTextDidChange?(string)
    }

    public func textView(
        _ textView: TextView,
        shouldReplaceContentsIn range: NSRange,
        with string: String
    ) -> Bool {
        let mutation = TextMutation(
            string: string,
            range: range,
            limit: textView.textStorage.length
        )

        return shouldApplyMutation(mutation, to: textView)
    }

    func textViewDidChange(
        _ textView: TextView,
        newText: String
    ) {
        onTextDidChange?(newText)
    }
}

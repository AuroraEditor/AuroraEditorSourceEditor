//
//  AuroraEditorSourceEditor+Coordinator.swift
//  AuroraEditorSourceEditor
//
//  Created by Khan Winter on 5/20/24.
//

import Foundation
import AuroraEditorTextView

extension AuroraEditorSourceEditor {
    @MainActor
    public class Coordinator: NSObject {
        var parent: AuroraEditorSourceEditor
        weak var controller: TextViewController?
        var isUpdatingFromRepresentable: Bool = false
        var isUpdateFromTextView: Bool = false

        init(parent: AuroraEditorSourceEditor) {
            self.parent = parent
            super.init()

            NotificationCenter.default.addObserver(
                self,
                selector: #selector(textViewDidChangeText(_:)),
                name: TextView.textDidChangeNotification,
                object: nil
            )

            NotificationCenter.default.addObserver(
                self,
                selector: #selector(textControllerCursorsDidUpdate(_:)),
                name: TextViewController.cursorPositionUpdatedNotification,
                object: nil
            )
        }

        @objc func textViewDidChangeText(_ notification: Notification) {
            guard let textView = notification.object as? TextView,
                  let controller,
                  controller.textView === textView else {
                return
            }
            if case .binding(let binding) = parent.text {
                binding.wrappedValue = textView.string
            }
            parent.coordinators.forEach {
                $0.textViewDidChangeText(controller: controller)
            }
        }

        @objc func textControllerCursorsDidUpdate(_ notification: Notification) {
            guard !isUpdatingFromRepresentable else { return }
            self.isUpdateFromTextView = true
            self.parent.cursorPositions.wrappedValue = self.controller?.cursorPositions ?? []
            if self.controller != nil {
                self.parent.coordinators.forEach {
                    $0.textViewDidChangeSelection(
                        controller: self.controller!,
                        newPositions: self.controller!.cursorPositions
                    )
                }
            }
        }

        deinit {
            parent.coordinators.forEach {
                $0.destroy()
            }
            parent.coordinators.removeAll()
            NotificationCenter.default.removeObserver(self)
        }
    }
}

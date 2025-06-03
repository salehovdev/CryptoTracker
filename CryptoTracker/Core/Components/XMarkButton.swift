//
//  XMarkButton.swift
//  CryptoTracker
//
//  Created by Fuad Salehov on 01.06.25.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
        }
    }
}

#Preview {
    XMarkButton()
}

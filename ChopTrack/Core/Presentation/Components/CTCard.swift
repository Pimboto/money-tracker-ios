// Path: /ChopTrack/Core/Presentation/Components/CTCard.swift

import SwiftUI

struct CTCard<Content: View>: View {
    let content: Content
    var padding: CGFloat = Spacing.md
    
    init(padding: CGFloat = Spacing.md, @ViewBuilder content: () -> Content) {
        self.padding = padding
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(padding)
            .background(Color.ctSurface)
            .cornerRadius(Radius.lg)
            .ctShadow(.light)
    }
}

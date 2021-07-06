#if canImport(UIKit)
import UIKit
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
struct Preview<View: UIView>: UIViewRepresentable {
    private let builder: () -> View
    init(builder: @escaping () -> View) {
        self.builder = builder
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }

    func makeUIView(context: Context) -> some UIView {
        builder()
    }

    func makeCoordinator() -> () { () }
}

#endif
#endif

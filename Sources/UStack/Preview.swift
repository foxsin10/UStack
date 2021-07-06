#if canImport(UIKit)
import UIKit
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct Preview<View: UIView>: UIViewRepresentable {
    private let builder: () -> View
    public init(builder: @escaping () -> View) {
        self.builder = builder
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }

    public func makeUIView(context: Context) -> some UIView {
        builder()
    }

    public func makeCoordinator() -> () { () }
}

#endif
#endif

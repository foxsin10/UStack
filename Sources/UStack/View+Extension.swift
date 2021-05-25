#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
public typealias LayoutPriority = LayoutConstraint.Priority
#endif

public extension View {
    @discardableResult
    func withSubViews(@ViewStackBuilder views: () -> View) -> View {
        let subView = views()
        switch subView {
        case let view as StackView:
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
            return self

        default:
            subView.subviews.forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview($0)
            }
            return self
        }
    }

    static func spacer(height: CGFloat? = nil, width: CGFloat? = nil) -> View {
        let view = View()
        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        #if canImport(UIKit)
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 0), for: .vertical)
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 0), for: .horizontal)
        #elseif canImport(AppKit)
        view.setContentHuggingPriority(LayoutPriority(0), for: .horizontal)
        view.setContentHuggingPriority(LayoutPriority(0), for: .vertical)
        #endif

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

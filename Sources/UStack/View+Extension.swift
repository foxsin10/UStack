#if canImport(UIKit)
import UIKit
public typealias LayoutPriority = UILayoutPriority
#elseif canImport(AppKit)
import AppKit
public typealias LayoutPriority = LayoutConstraint.Priority
#endif

public extension View {
    @discardableResult
    func withSubViews(@ContainerViewBuilder views: () -> [View]) -> View {
        let subViews = views()
        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        return self
    }

    static func spacer(height: CGFloat? = nil, width: CGFloat? = nil) -> View {
        let view = View()
        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        view.setContentHuggingPriority(LayoutPriority(0), for: .horizontal)
        view.setContentHuggingPriority(LayoutPriority(0), for: .vertical)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

open class Spacer: View {
    public init(height: CGFloat? = nil, width: CGFloat? = nil) {
        super.init(frame: .zero)
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        self.setContentHuggingPriority(LayoutPriority(0), for: .horizontal)
        self.setContentHuggingPriority(LayoutPriority(0), for: .vertical)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setContentHuggingPriority(LayoutPriority(0), for: .horizontal)
        self.setContentHuggingPriority(LayoutPriority(0), for: .vertical)

        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

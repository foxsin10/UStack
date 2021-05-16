import UIKit

public extension UIView {
    @discardableResult
    func withSubViews(@ViewStackBuilder views: () -> UIView) -> UIView {
        views().subviews.forEach { self.addSubview($0) }
        return self
    }

    static func spacer(height: CGFloat? = nil, width: CGFloat? = nil) -> UIView {
        let view = UIView()
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 0), for: .vertical)
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 0), for: .horizontal)
        view.translatesAutoresizingMaskIntoConstraints = false
        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        return view
    }
}

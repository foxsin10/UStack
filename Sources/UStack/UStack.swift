#if canImport(UIKit)
import UIKit

@resultBuilder
enum HStackBuilder {
    static func buildBlock(_ components: UIView...) -> UIStackView {
        let view = UIStackView(arrangedSubviews: components)
        view.axis = .horizontal
        return view
    }
}

@resultBuilder
enum VStackBuilder {
    static func buildBlock(_ components: UIView...) -> UIStackView {
        let view = UIStackView(arrangedSubviews: components)
        view.axis = .vertical
        return view
    }
}

@resultBuilder
enum ContainerViewBuilder {
    static func buildBlock(_ components: UIView...) -> UIView {
        let view = UIView()
        components.forEach { view.addSubview($0) }
        return view
    }
}

@resultBuilder
enum ViewStackBuilder {
    static func buildBlock(_ components: UIView...) -> [UIView] {
        return components
    }
}

extension UIView {
    @discardableResult
    func withSubViews(@ViewStackBuilder views: () -> [UIView]) -> UIView {
        views().forEach { self.addSubview($0) }
        return self
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal,
                     spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> [UIView]) {
        self.init(arrangedSubviews: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = axis
    }
}

final class HStack: UIStackView {}
extension HStack {
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> [UIView]) {
        self.init(arrangedSubviews: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .horizontal
    }
}

final class VStack: UIStackView {}
extension VStack {
    convenience init(spacing: CGFloat = 0,
                     distribution: Distribution = .fill,
                     alignment: Alignment = .fill,
                     @ViewStackBuilder views: () -> [UIView]) {
        self.init(arrangedSubviews: views())
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.axis = .vertical
    }
}
#endif
